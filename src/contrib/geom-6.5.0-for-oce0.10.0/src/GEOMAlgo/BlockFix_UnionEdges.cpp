// Copyright (C) 2007-2012  CEA/DEN, EDF R&D, OPEN CASCADE
//
// Copyright (C) 2003-2007  OPEN CASCADE, EADS/CCR, LIP6, CEA/DEN,
// CEDRAT, EDF R&D, LEG, PRINCIPIA R&D, BUREAU VERITAS
//
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 2.1 of the License.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with this library; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
//
// See http://www.salome-platform.org/ or email : webmaster.salome@opencascade.com

// File:      BlockFix_UnionEdges.cxx
// Created:   07.12.04 15:27:30
// Author:    Sergey KUUL

#include <BlockFix_UnionEdges.ixx>

#include <ShapeAnalysis_Edge.hxx>

#include <ShapeFix_Edge.hxx>
#include <ShapeFix_Face.hxx>
#include <ShapeFix_Shell.hxx>

#include <BRep_Builder.hxx>
#include <BRep_CurveRepresentation.hxx>
#include <BRep_ListIteratorOfListOfCurveRepresentation.hxx>
#include <BRep_TEdge.hxx>
#include <BRep_Tool.hxx>
#include <BRepAdaptor_HCompCurve.hxx>
#include <BRepLib.hxx>
#include <BRepLib_MakeEdge.hxx>

#include <TopExp.hxx>
#include <TopExp_Explorer.hxx>

#include <TopTools_IndexedDataMapOfShapeListOfShape.hxx>
#include <TopTools_IndexedMapOfShape.hxx>
#include <TopTools_ListOfShape.hxx>
#include <TopTools_MapOfShape.hxx>
#include <TopTools_ListIteratorOfListOfShape.hxx>
#include <TopTools_SequenceOfShape.hxx>

#include <TopoDS.hxx>
#include <TopoDS_Edge.hxx>
#include <TopoDS_Face.hxx>
#include <TopoDS_Shell.hxx>
#include <TopoDS_Solid.hxx>
#include <TopoDS_Vertex.hxx>
#include <TopoDS_Iterator.hxx>

#include <Approx_Curve3d.hxx>

#include <GC_MakeCircle.hxx>

#include <Geom_BSplineCurve.hxx>
#include <Geom_Circle.hxx>
#include <Geom_Curve.hxx>
#include <Geom_Line.hxx>
#include <Geom_TrimmedCurve.hxx>
#include <GeomConvert.hxx>
#include <GeomConvert_CompCurveToBSplineCurve.hxx>

#include <Geom2dConvert.hxx>
#include <Geom2dConvert_CompCurveToBSplineCurve.hxx>
#include <Geom2d_TrimmedCurve.hxx>
#include <Geom2d_BSplineCurve.hxx>

#include <TColGeom_SequenceOfSurface.hxx>
#include <TColGeom_Array1OfBSplineCurve.hxx>
#include <TColGeom_HArray1OfBSplineCurve.hxx>
#include <TColGeom2d_Array1OfBSplineCurve.hxx>
#include <TColGeom2d_HArray1OfBSplineCurve.hxx>
#include <TColGeom2d_SequenceOfBoundedCurve.hxx>
#include <TColgp_SequenceOfPnt.hxx>
#include <TColStd_Array1OfReal.hxx>
#include <TColStd_MapOfInteger.hxx>

#include "utilities.h"

//=======================================================================
//function : BlockFix_UnionEdges()
//purpose  : Constructor
//=======================================================================
BlockFix_UnionEdges::BlockFix_UnionEdges (  )
{
}

//=======================================================================
//function : GlueEdgesWithPCurves
//purpose  : Glues the pcurves of the sequence of edges
//           and glues their 3d curves
//=======================================================================
static TopoDS_Edge GlueEdgesWithPCurves(const TopTools_SequenceOfShape& aChain,
                                        const TopoDS_Vertex& FirstVertex,
                                        const TopoDS_Vertex& LastVertex)
{
  Standard_Integer i, j;

  TopoDS_Edge FirstEdge = TopoDS::Edge(aChain(1));
  //TColGeom2d_SequenceOfCurve PCurveSeq;
  TColGeom_SequenceOfSurface SurfSeq;
  //TopTools_SequenceOfShape LocSeq;
  
  BRep_ListIteratorOfListOfCurveRepresentation itr( (Handle(BRep_TEdge)::DownCast(FirstEdge.TShape()))->Curves() );
  for (; itr.More(); itr.Next())
  {
    Handle(BRep_CurveRepresentation) CurveRep = itr.Value();
    if (CurveRep->IsCurveOnSurface())
    {
      //PCurveSeq.Append(CurveRep->PCurve());
      SurfSeq.Append(CurveRep->Surface());
      /*
      TopoDS_Shape aLocShape;
      aLocShape.Location(CurveRep->Location());
      LocSeq.Append(aLocShape);
      */
    }
  }

  Standard_Real fpar, lpar;
  BRep_Tool::Range(FirstEdge, fpar, lpar);
  TopoDS_Edge PrevEdge = FirstEdge;
  TopoDS_Vertex CV;
  Standard_Real MaxTol = 0.;
  
  TopoDS_Edge ResEdge;
  BRep_Builder BB;

  Standard_Integer nb_curve = aChain.Length();   //number of curves
  TColGeom_Array1OfBSplineCurve tab_c3d(0,nb_curve-1);                    //array of the curves
  TColStd_Array1OfReal tabtolvertex(0,nb_curve-1); //(0,nb_curve-2);  //array of the tolerances
    
  TopoDS_Vertex PrevVertex = FirstVertex;
  for (i = 1; i <= nb_curve; i++)
  {
    TopoDS_Edge anEdge = TopoDS::Edge(aChain(i));
    TopoDS_Vertex VF, VL;
    TopExp::Vertices(anEdge, VF, VL);
    Standard_Boolean ToReverse = (!VF.IsSame(PrevVertex));
    
    Standard_Real Tol1 = BRep_Tool::Tolerance(VF);
    Standard_Real Tol2 = BRep_Tool::Tolerance(VL);
    if (Tol1 > MaxTol)
      MaxTol = Tol1;
    if (Tol2 > MaxTol)
      MaxTol = Tol2;
    
    if (i > 1)
    {
      TopExp::CommonVertex(PrevEdge, anEdge, CV);
      Standard_Real Tol = BRep_Tool::Tolerance(CV);
      tabtolvertex(i-2) = Tol;
    }
    
    Handle(Geom_Curve) aCurve = BRep_Tool::Curve(anEdge, fpar, lpar);
    Handle(Geom_TrimmedCurve) aTrCurve = new Geom_TrimmedCurve(aCurve, fpar, lpar);
    tab_c3d(i-1) = GeomConvert::CurveToBSplineCurve(aTrCurve);
    GeomConvert::C0BSplineToC1BSplineCurve(tab_c3d(i-1), Precision::Confusion());
    if (ToReverse)
      tab_c3d(i-1)->Reverse();
    PrevVertex = (ToReverse)? VF : VL;
    PrevEdge = anEdge;
  }
  Handle(TColGeom_HArray1OfBSplineCurve)  concatcurve;     //array of the concatenated curves
  Handle(TColStd_HArray1OfInteger)        ArrayOfIndices;  //array of the remining Vertex
  GeomConvert::ConcatC1(tab_c3d,
                        tabtolvertex,
                        ArrayOfIndices,
                        concatcurve,
                        Standard_False,
                        Precision::Confusion());   //C1 concatenation
  
  if (concatcurve->Length() > 1)
  {
    GeomConvert_CompCurveToBSplineCurve Concat(concatcurve->Value(concatcurve->Lower()));
    
    for (i = concatcurve->Lower()+1; i <= concatcurve->Upper(); i++)
      Concat.Add( concatcurve->Value(i), MaxTol, Standard_True );
    
    concatcurve->SetValue(concatcurve->Lower(), Concat.BSplineCurve());
  }
  Handle(Geom_BSplineCurve) ResCurve = concatcurve->Value(concatcurve->Lower());
  
  TColGeom2d_SequenceOfBoundedCurve ResPCurves;
  TopLoc_Location aLoc;
  for (j = 1; j <= SurfSeq.Length(); j++)
  {
    TColGeom2d_Array1OfBSplineCurve tab_c2d(0,nb_curve-1); //array of the pcurves
    
    PrevVertex = FirstVertex;
    PrevEdge = FirstEdge;
    //TopLoc_Location theLoc = LocSeq(j).Location();
    for (i = 1; i <= nb_curve; i++)
    {
      TopoDS_Edge anEdge = TopoDS::Edge(aChain(i));
      TopoDS_Vertex VF, VL;
      TopExp::Vertices(anEdge, VF, VL);
      Standard_Boolean ToReverse = (!VF.IsSame(PrevVertex));

      /*
      Handle(Geom2d_Curve) aPCurve =
        BRep_Tool::CurveOnSurface(anEdge, SurfSeq(j), anEdge.Location()*theLoc, fpar, lpar);
      */
      Handle(Geom2d_Curve) aPCurve =
        BRep_Tool::CurveOnSurface(anEdge, SurfSeq(j), aLoc, fpar, lpar);
      Handle(Geom2d_TrimmedCurve) aTrPCurve = new Geom2d_TrimmedCurve(aPCurve, fpar, lpar);
      tab_c2d(i-1) = Geom2dConvert::CurveToBSplineCurve(aTrPCurve);
      Geom2dConvert::C0BSplineToC1BSplineCurve(tab_c2d(i-1), Precision::Confusion());
      if (ToReverse)
        tab_c2d(i-1)->Reverse();
      PrevVertex = (ToReverse)? VF : VL;
      PrevEdge = anEdge;
    }
    Handle(TColGeom2d_HArray1OfBSplineCurve)  concatc2d;     //array of the concatenated curves
    Handle(TColStd_HArray1OfInteger)        ArrayOfInd2d;  //array of the remining Vertex
    Geom2dConvert::ConcatC1(tab_c2d,
                            tabtolvertex,
                            ArrayOfInd2d,
                            concatc2d,
                            Standard_False,
                            Precision::Confusion());   //C1 concatenation
    
    if (concatc2d->Length() > 1)
    {
      Geom2dConvert_CompCurveToBSplineCurve Concat2d(concatc2d->Value(concatc2d->Lower()));
      
      for (i = concatc2d->Lower()+1; i <= concatc2d->Upper(); i++)
        Concat2d.Add( concatc2d->Value(i), MaxTol, Standard_True );
      
      concatc2d->SetValue(concatc2d->Lower(), Concat2d.BSplineCurve());
    }
    Handle(Geom2d_BSplineCurve) aResPCurve = concatc2d->Value(concatc2d->Lower());
    ResPCurves.Append(aResPCurve);
  }
  
  ResEdge = BRepLib_MakeEdge(ResCurve,
                             FirstVertex, LastVertex,
                             ResCurve->FirstParameter(), ResCurve->LastParameter());
  BB.SameRange(ResEdge, Standard_False);
  BB.SameParameter(ResEdge, Standard_False);
  for (j = 1; j <= ResPCurves.Length(); j++)
  {
    BB.UpdateEdge(ResEdge, ResPCurves(j), SurfSeq(j), aLoc, MaxTol);
    BB.Range(ResEdge, SurfSeq(j), aLoc, ResPCurves(j)->FirstParameter(), ResPCurves(j)->LastParameter());
  }

  BRepLib::SameParameter(ResEdge, MaxTol, Standard_True);
  
  return ResEdge;
}

//=======================================================================
//function : MergeEdges
//purpose  : auxilary
//=======================================================================
static Standard_Boolean MergeEdges(const TopTools_SequenceOfShape& SeqEdges,
                                   const TopoDS_Face& aFace,
                                   const Standard_Real Tol,
                                   TopoDS_Edge& anEdge)
{
  // make chain for union
  BRep_Builder B;
  ShapeAnalysis_Edge sae;
  TopoDS_Edge FirstE = TopoDS::Edge(SeqEdges.Value(1));
  TopoDS_Edge LastE = FirstE;
  TopoDS_Vertex VF = sae.FirstVertex(FirstE);
  TopoDS_Vertex VL = sae.LastVertex(LastE);
  TopTools_SequenceOfShape aChain;
  aChain.Append(FirstE);
  TColStd_MapOfInteger IndUsedEdges;
  IndUsedEdges.Add(1);
  Standard_Integer j;
  for(j=2; j<=SeqEdges.Length(); j++) {
    for(Standard_Integer k=2; k<=SeqEdges.Length(); k++) {
      if(IndUsedEdges.Contains(k)) continue;
      TopoDS_Edge edge = TopoDS::Edge(SeqEdges.Value(k));
      TopoDS_Vertex VF2 = sae.FirstVertex(edge);
      TopoDS_Vertex VL2 = sae.LastVertex(edge);
      if(sae.FirstVertex(edge).IsSame(VL)) {
        aChain.Append(edge);
        LastE = edge;
        VL = sae.LastVertex(LastE);
        IndUsedEdges.Add(k);
      }
      else if(sae.LastVertex(edge).IsSame(VF)) {
        aChain.Prepend(edge);
        FirstE = edge;
        VF = sae.FirstVertex(FirstE);
        IndUsedEdges.Add(k);
      }
    }
  }
  if(aChain.Length()<SeqEdges.Length()) {
    MESSAGE ("can not create correct chain...");
    return Standard_False;
  }
  // union edges in chain
  // first step: union lines and circles
  TopLoc_Location Loc;
  Standard_Real fp1,lp1,fp2,lp2;
  for(j=1; j<aChain.Length(); j++) {
    TopoDS_Edge edge1 = TopoDS::Edge(aChain.Value(j));
    Handle(Geom_Curve) c3d1 = BRep_Tool::Curve(edge1,Loc,fp1,lp1);
    if(c3d1.IsNull()) break;
    while(c3d1->IsKind(STANDARD_TYPE(Geom_TrimmedCurve))) {
      Handle(Geom_TrimmedCurve) tc =
        Handle(Geom_TrimmedCurve)::DownCast(c3d1);
      c3d1 = tc->BasisCurve();
    }
    TopoDS_Edge edge2 = TopoDS::Edge(aChain.Value(j+1));
    Handle(Geom_Curve) c3d2 = BRep_Tool::Curve(edge2,Loc,fp2,lp2);
    if(c3d2.IsNull()) break;
    while(c3d2->IsKind(STANDARD_TYPE(Geom_TrimmedCurve))) {
      Handle(Geom_TrimmedCurve) tc =
        Handle(Geom_TrimmedCurve)::DownCast(c3d2);
      c3d2 = tc->BasisCurve();
    }
    if( c3d1->IsKind(STANDARD_TYPE(Geom_Line)) && c3d2->IsKind(STANDARD_TYPE(Geom_Line)) ) {
      // union lines
      Handle(Geom_Line) L1 = Handle(Geom_Line)::DownCast(c3d1);
      Handle(Geom_Line) L2 = Handle(Geom_Line)::DownCast(c3d2);
      gp_Dir Dir1 = L1->Position().Direction();
      gp_Dir Dir2 = L2->Position().Direction();
      //if(!Dir1.IsEqual(Dir2,Precision::Angular())) {
      //if(!Dir1.IsParallel(Dir2,Precision::Angular())) {
      if(!Dir1.IsParallel(Dir2,Tol)) {
        continue;
      }
      // can union lines => create new edge
      TopoDS_Vertex V1 = sae.FirstVertex(edge1);
      gp_Pnt PV1 = BRep_Tool::Pnt(V1);
      TopoDS_Vertex V2 = sae.LastVertex(edge2);
      gp_Pnt PV2 = BRep_Tool::Pnt(V2);
      gp_Vec Vec(PV1,PV2);
      Handle(Geom_Line) L = new Geom_Line(gp_Ax1(PV1,Vec));
      Standard_Real dist = PV1.Distance(PV2);
      Handle(Geom_TrimmedCurve) tc = new Geom_TrimmedCurve(L,0.0,dist);
      TopoDS_Edge E;
      B.MakeEdge (E,tc,Precision::Confusion());
      B.Add (E,V1);  B.Add (E,V2);
      B.UpdateVertex(V1, 0., E, 0.);
      B.UpdateVertex(V2, dist, E, 0.);
      //ShapeFix_Edge sfe;
      //sfe.FixAddPCurve(E,aFace,Standard_False);
      //sfe.FixSameParameter(E);
      aChain.Remove(j);
      aChain.SetValue(j,E);
      j--;
    }
    if( c3d1->IsKind(STANDARD_TYPE(Geom_Circle)) && c3d2->IsKind(STANDARD_TYPE(Geom_Circle)) ) {
      // union circles
      Handle(Geom_Circle) C1 = Handle(Geom_Circle)::DownCast(c3d1);
      Handle(Geom_Circle) C2 = Handle(Geom_Circle)::DownCast(c3d2);
      gp_Pnt P01 = C1->Location();
      gp_Pnt P02 = C2->Location();
      if (P01.Distance(P02) > Precision::Confusion()) continue;
      // can union circles => create new edge
      TopoDS_Vertex V1 = sae.FirstVertex(edge1);
      gp_Pnt PV1 = BRep_Tool::Pnt(V1);
      TopoDS_Vertex V2 = sae.LastVertex(edge2);
      gp_Pnt PV2 = BRep_Tool::Pnt(V2);
      TopoDS_Vertex VM = sae.LastVertex(edge1);
      gp_Pnt PVM = BRep_Tool::Pnt(VM);
      GC_MakeCircle MC (PV1,PVM,PV2);
      Handle(Geom_Circle) C = MC.Value();
      TopoDS_Edge E;
      if (!MC.IsDone() || C.IsNull()) {
        // jfa for Mantis issue 0020228
        if (PV1.Distance(PV2) > Precision::Confusion()) continue;
        // closed chain
        C = C1;
        B.MakeEdge (E,C,Precision::Confusion());
        B.Add(E,V1);
        B.Add(E,V2);
      }
      else {
        gp_Pnt P0 = C->Location();
        gp_Dir D1(gp_Vec(P0,PV1));
        gp_Dir D2(gp_Vec(P0,PV2));
        Standard_Real fpar = C->XAxis().Direction().Angle(D1);
        if(fabs(fpar)>Precision::Confusion()) {
          // check orientation
          gp_Dir ND =  C->XAxis().Direction().Crossed(D1);
          if(ND.IsOpposite(C->Axis().Direction(),Precision::Confusion())) {
            fpar = -fpar;
          }
        }
        Standard_Real lpar = C->XAxis().Direction().Angle(D2);
        if(fabs(lpar)>Precision::Confusion()) {
          // check orientation
          gp_Dir ND =  C->XAxis().Direction().Crossed(D2);
          if(ND.IsOpposite(C->Axis().Direction(),Precision::Confusion())) {
            lpar = -lpar;
          }
        }
        if (lpar < fpar) lpar += 2*M_PI;
        Handle(Geom_TrimmedCurve) tc = new Geom_TrimmedCurve(C,fpar,lpar);
        B.MakeEdge (E,tc,Precision::Confusion());
        B.Add(E,V1);
        B.Add(E,V2);
        B.UpdateVertex(V1, fpar, E, 0.);
        B.UpdateVertex(V2, lpar, E, 0.);
      }
      aChain.Remove(j);
      aChain.SetValue(j,E);
      j--;
    }
  }
  if (j < aChain.Length()) {
    MESSAGE ("null curve3d in edge...");
    return Standard_False;
  }
  if (aChain.Length() > 1) {
    // second step: union edges with various curves
    // skl for bug 0020052 from Mantis: perform such unions
    // only if curves are bspline or bezier
    bool NeedUnion = true;
    for(j=1; j<=aChain.Length(); j++) {
      TopoDS_Edge edge = TopoDS::Edge(aChain.Value(j));
      Handle(Geom_Curve) c3d = BRep_Tool::Curve(edge,Loc,fp1,lp1);
      if(c3d.IsNull()) continue;
      while(c3d->IsKind(STANDARD_TYPE(Geom_TrimmedCurve))) {
        Handle(Geom_TrimmedCurve) tc =
          Handle(Geom_TrimmedCurve)::DownCast(c3d);
        c3d = tc->BasisCurve();
      }
      if( ( c3d->IsKind(STANDARD_TYPE(Geom_BSplineCurve)) ||
            c3d->IsKind(STANDARD_TYPE(Geom_BezierCurve)) ) ) continue;
      NeedUnion = false;
      break;
    }
    if(NeedUnion) {
      MESSAGE ("can not make analitical union => make approximation");
      TopoDS_Edge E = GlueEdgesWithPCurves(aChain, VF, VL);
      /*
      TopoDS_Wire W;
      B.MakeWire(W);
      for(j=1; j<=aChain.Length(); j++) {
        TopoDS_Edge edge = TopoDS::Edge(aChain.Value(j));
        B.Add(W,edge);
      }
      Handle(BRepAdaptor_HCompCurve) Adapt = new BRepAdaptor_HCompCurve(W);
      Approx_Curve3d Conv(Adapt,Tol,GeomAbs_C1,9,1000);
      Handle(Geom_BSplineCurve) bc = Conv.Curve();
      TopoDS_Edge E;
      B.MakeEdge (E,bc,Precision::Confusion());
      B.Add (E,VF);
      B.Add (E,VL);
      */
      aChain.SetValue(1,E);
    }
    else {
      MESSAGE ("can not make approximation for such types of curves");
      return Standard_False;
    }
  }

  anEdge = TopoDS::Edge(aChain.Value(1));
  return Standard_True;
}

//=======================================================================
//function : Perform
//purpose  :
//=======================================================================
TopoDS_Shape BlockFix_UnionEdges::Perform(const TopoDS_Shape& Shape,
                                          const Standard_Real Tol)
{
  myContext = new ShapeBuild_ReShape;
  myTolerance = Tol;
  TopoDS_Shape aResult = myContext->Apply(Shape);

  // processing each solid
  TopAbs_ShapeEnum aType = TopAbs_SOLID;
  TopExp_Explorer exps (Shape, aType);
  if (!exps.More()) {
    aType = TopAbs_SHELL;
    exps.Init(Shape, aType);
  }
  for (; exps.More(); exps.Next()) {
    //TopoDS_Solid aSolid = TopoDS::Solid(exps.Current());
    TopoDS_Shape aSolid = exps.Current();

    TopTools_IndexedMapOfShape ChangedFaces;

    // creating map of edge faces
    TopTools_IndexedDataMapOfShapeListOfShape aMapEdgeFaces;
    TopExp::MapShapesAndAncestors(aSolid, TopAbs_EDGE, TopAbs_FACE, aMapEdgeFaces);

    Handle(ShapeBuild_ReShape) aContext = new ShapeBuild_ReShape;
    TopoDS_Shape aRes = aSolid;
    aRes = aContext->Apply(aSolid);

    // processing each face
    TopExp_Explorer exp;
    for (exp.Init(aRes, TopAbs_FACE); exp.More(); exp.Next()) {
      TopoDS_Face aFace =
        TopoDS::Face(aContext->Apply(exp.Current().Oriented(TopAbs_FORWARD)));
      TopTools_IndexedDataMapOfShapeListOfShape aMapFacesEdges;

      for (TopExp_Explorer expe(aFace,TopAbs_EDGE); expe.More(); expe.Next()) {
        TopoDS_Edge edge = TopoDS::Edge(expe.Current());
        if (!aMapEdgeFaces.Contains(edge)) continue;
        const TopTools_ListOfShape& aList = aMapEdgeFaces.FindFromKey(edge);
        TopTools_ListIteratorOfListOfShape anIter(aList);
        for ( ; anIter.More(); anIter.Next()) {
          TopoDS_Face face = TopoDS::Face(anIter.Value());
          TopoDS_Face face1 = TopoDS::Face(aContext->Apply(anIter.Value()));
          if (face1.IsSame(aFace)) continue;
          if (aMapFacesEdges.Contains(face)) {
            aMapFacesEdges.ChangeFromKey(face).Append(edge);
          }
          else {
            TopTools_ListOfShape ListEdges;
            ListEdges.Append(edge);
            aMapFacesEdges.Add(face,ListEdges);
          }
        }
      }

      for (Standard_Integer i=1; i<=aMapFacesEdges.Extent(); i++) {
        const TopTools_ListOfShape& ListEdges = aMapFacesEdges.FindFromIndex(i);
        TopTools_SequenceOfShape SeqEdges;
        TopTools_ListIteratorOfListOfShape anIter(ListEdges);
        for ( ; anIter.More(); anIter.Next()) {
          SeqEdges.Append(anIter.Value());
        }
        if (SeqEdges.Length()==1) continue;
        TopoDS_Edge E;
        if ( MergeEdges(SeqEdges,aFace,Tol,E) ) {
          // now we have only one edge - aChain.Value(1)
          // we have to replace old ListEdges with this new edge
          aContext->Replace(SeqEdges(1),E);
          for (Standard_Integer j=2; j<=SeqEdges.Length(); j++) {
            aContext->Remove(SeqEdges(j));
          }
          TopoDS_Face tmpF = TopoDS::Face(exp.Current());
          if ( !ChangedFaces.Contains(tmpF) )
            ChangedFaces.Add(tmpF);
          tmpF = TopoDS::Face(aMapFacesEdges.FindKey(i));
          if ( !ChangedFaces.Contains(tmpF) )
            ChangedFaces.Add(tmpF);
        }
      }

    } // end processing each face

    // fix changed faces and replace them in the local context
    for (Standard_Integer i=1; i<=ChangedFaces.Extent(); i++) {
      TopoDS_Face aFace = TopoDS::Face(aContext->Apply(ChangedFaces.FindKey(i)));
      Handle(ShapeFix_Face) sff = new ShapeFix_Face(aFace);
      sff->SetContext(myContext);
      sff->SetPrecision(myTolerance);
      sff->SetMinTolerance(myTolerance);
      sff->SetMaxTolerance(Max(1.,myTolerance*1000.));
      sff->Perform();
      aContext->Replace(aFace,sff->Face());
    }

    if (ChangedFaces.Extent() > 0) {
      // fix changed shell and replace it in the local context
      TopoDS_Shape aRes1 = aContext->Apply(aRes);
      TopExp_Explorer expsh;
      for (expsh.Init(aRes1, TopAbs_SHELL); expsh.More(); expsh.Next()) {
        TopoDS_Shell aShell = TopoDS::Shell(expsh.Current());
        Handle(ShapeFix_Shell) sfsh = new ShapeFix_Shell;
        sfsh->FixFaceOrientation(aShell);
        aContext->Replace(aShell,sfsh->Shell());
      }
      TopoDS_Shape aRes2 = aContext->Apply(aRes1);
      // put new solid into global context
      myContext->Replace(aSolid,aRes2);
    }

  } // end processing each solid

  aResult = myContext->Apply(Shape);
  return aResult;
}
