/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module BRepFeat

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include BRepFeat_dependencies.i


%include BRepFeat_headers.i


enum BRepFeat_PerfSelection {
	BRepFeat_NoSelection,
	BRepFeat_SelectionFU,
	BRepFeat_SelectionU,
	BRepFeat_SelectionSh,
	BRepFeat_SelectionShU,
	};

enum BRepFeat_StatusError {
	BRepFeat_OK,
	BRepFeat_BadDirect,
	BRepFeat_BadIntersect,
	BRepFeat_EmptyBaryCurve,
	BRepFeat_EmptyCutResult,
	BRepFeat_FalseSide,
	BRepFeat_IncDirection,
	BRepFeat_IncSlidFace,
	BRepFeat_IncParameter,
	BRepFeat_IncTypes,
	BRepFeat_IntervalOverlap,
	BRepFeat_InvFirstShape,
	BRepFeat_InvOption,
	BRepFeat_InvShape,
	BRepFeat_LocOpeNotDone,
	BRepFeat_LocOpeInvNotDone,
	BRepFeat_NoExtFace,
	BRepFeat_NoFaceProf,
	BRepFeat_NoGluer,
	BRepFeat_NoIntersectF,
	BRepFeat_NoIntersectU,
	BRepFeat_NoParts,
	BRepFeat_NoProjPt,
	BRepFeat_NotInitialized,
	BRepFeat_NotYetImplemented,
	BRepFeat_NullRealTool,
	BRepFeat_NullToolF,
	BRepFeat_NullToolU,
	};

enum BRepFeat_Status {
	BRepFeat_NoError,
	BRepFeat_InvalidPlacement,
	BRepFeat_HoleTooLong,
	};



%nodefaultctor BRepFeat_Builder;
class BRepFeat_Builder : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S, const TopoDS_Shape &T);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Modified(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		~BRepFeat_Builder();

};

%nodefaultctor BRepFeat_MakeCylindricalHole;
class BRepFeat_MakeCylindricalHole : public BRepFeat_Builder {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakeCylindricalHole();
		%feature("autodoc", "1");
		BRepFeat_MakeCylindricalHole(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		BRepFeat_MakeCylindricalHole(const TopoDS_Shape &S, const gp_Ax1 &Axis);
		%feature("autodoc", "1");
		void Init(const gp_Ax1 &Axis);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S, const gp_Ax1 &Axis);
		%feature("autodoc", "1");
		void Perform(const Standard_Real Radius);
		%feature("autodoc", "1");
		void Perform(const Standard_Real Radius, const Standard_Real PFrom, const Standard_Real PTo, const Standard_Boolean WithControl=1);
		%feature("autodoc", "1");
		void PerformThruNext(const Standard_Real Radius, const Standard_Boolean WithControl=1);
		%feature("autodoc", "1");
		void PerformUntilEnd(const Standard_Real Radius, const Standard_Boolean WithControl=1);
		%feature("autodoc", "1");
		void PerformBlind(const Standard_Real Radius, const Standard_Real Length, const Standard_Boolean WithControl=1);
		%feature("autodoc", "1");
		BRepFeat_Status Status() const;
		%feature("autodoc", "1");
		virtual		void Build();
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakeCylindricalHole();

};

%nodefaultctor BRepFeat_Form;
class BRepFeat_Form : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Modified(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Generated(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDeleted(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		const TopTools_ListOfShape & FirstShape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & LastShape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & NewEdges() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & TgtEdges() const;
		%feature("autodoc", "1");
		void BasisShapeValid();
		%feature("autodoc", "1");
		void GeneratedShapeValid();
		%feature("autodoc", "1");
		void ShapeFromValid();
		%feature("autodoc", "1");
		void ShapeUntilValid();
		%feature("autodoc", "1");
		void GluedFacesValid();
		%feature("autodoc", "1");
		void SketchFaceValid();
		%feature("autodoc", "1");
		void PerfSelectionValid();
		%feature("autodoc", "1");
		virtual		void Curves(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		virtual		Handle_Geom_Curve BarycCurve();
		%feature("autodoc", "1");
		BRepFeat_StatusError CurrentStatusError() const;

};

%nodefaultctor BRepFeat;
class BRepFeat {
	public:
		%feature("autodoc", "1");
		~BRepFeat();
		%feature("autodoc", "1");
		BRepFeat();
		%feature("autodoc", "1");
		void SampleEdges(const TopoDS_Shape &S, TColgp_SequenceOfPnt & Pt);
		%feature("autodoc", "1");
		void Barycenter(const TopoDS_Shape &S, gp_Pnt & Pt);
		%feature("autodoc", "1");
		Standard_Real ParametricBarycenter(const TopoDS_Shape &S, const Handle_Geom_Curve &C);
		%feature("autodoc", "1");
		void ParametricMinMax(const TopoDS_Shape &S, const Handle_Geom_Curve &C, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean & flag, const Standard_Boolean Ori=0);
		%feature("autodoc", "1");
		Standard_Boolean IsInside(const TopoDS_Face &F1, const TopoDS_Face &F2);
		%feature("autodoc", "1");
		void FaceUntil(const TopoDS_Shape &S, TopoDS_Face & F);
		%feature("autodoc", "1");
		TopoDS_Solid Tool(const TopoDS_Shape &SRef, const TopoDS_Face &Fac, const TopAbs_Orientation Orf);
		%feature("autodoc", "1");
		Standard_OStream & Print(const BRepFeat_StatusError SE, Standard_OStream & S);

};

%nodefaultctor BRepFeat_MakePipe;
class BRepFeat_MakePipe : public BRepFeat_Form {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakePipe();
		%feature("autodoc", "1");
		BRepFeat_MakePipe(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const TopoDS_Wire &Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const TopoDS_Wire &Spine, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &From, const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		virtual		void Curves(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		virtual		Handle_Geom_Curve BarycCurve();
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakePipe();

};

%nodefaultctor BRepFeat_MakePrism;
class BRepFeat_MakePrism : public BRepFeat_Form {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakePrism();
		%feature("autodoc", "1");
		BRepFeat_MakePrism(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const gp_Dir &Direc, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const gp_Dir &Direction, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform(const Standard_Real Length);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &From, const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void PerformUntilEnd();
		%feature("autodoc", "1");
		void PerformFromEnd(const TopoDS_Shape &FUntil);
		%feature("autodoc", "1");
		void PerformThruAll();
		%feature("autodoc", "1");
		void PerformUntilHeight(const TopoDS_Shape &Until, const Standard_Real Length);
		%feature("autodoc", "1");
		virtual		void Curves(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		virtual		Handle_Geom_Curve BarycCurve();
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakePrism();

};

%nodefaultctor BRepFeat_MakeDPrism;
class BRepFeat_MakeDPrism : public BRepFeat_Form {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakeDPrism(const TopoDS_Shape &Sbase, const TopoDS_Face &Pbase, const TopoDS_Face &Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		BRepFeat_MakeDPrism();
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Face &Pbase, const TopoDS_Face &Skface, const Standard_Real Angle, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform(const Standard_Real Height);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &From, const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void PerformUntilEnd();
		%feature("autodoc", "1");
		void PerformFromEnd(const TopoDS_Shape &FUntil);
		%feature("autodoc", "1");
		void PerformThruAll();
		%feature("autodoc", "1");
		void PerformUntilHeight(const TopoDS_Shape &Until, const Standard_Real Height);
		%feature("autodoc", "1");
		virtual		void Curves(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		virtual		Handle_Geom_Curve BarycCurve();
		%feature("autodoc", "1");
		void BossEdges(const Standard_Integer sig);
		%feature("autodoc", "1");
		const TopTools_ListOfShape & TopEdges();
		%feature("autodoc", "1");
		const TopTools_ListOfShape & LatEdges();
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakeDPrism();

};

%nodefaultctor BRepFeat_Gluer;
class BRepFeat_Gluer : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "1");
		BRepFeat_Gluer();
		%feature("autodoc", "1");
		BRepFeat_Gluer(const TopoDS_Shape &Snew, const TopoDS_Shape &Sbase);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Snew, const TopoDS_Shape &Sbase);
		%feature("autodoc", "1");
		void Bind(const TopoDS_Face &Fnew, const TopoDS_Face &Fbase);
		%feature("autodoc", "1");
		void Bind(const TopoDS_Edge &Enew, const TopoDS_Edge &Ebase);
		%feature("autodoc", "1");
		LocOpe_Operation OpeType() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & BasisShape() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & GluedShape() const;
		%feature("autodoc", "1");
		virtual		void Build();
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDeleted(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Modified(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		~BRepFeat_Gluer();

};

%nodefaultctor BRepFeat_SplitShape;
class BRepFeat_SplitShape : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "1");
		BRepFeat_SplitShape();
		%feature("autodoc", "1");
		BRepFeat_SplitShape(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void Add(const TopoDS_Wire &W, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Edge &EOn);
		%feature("autodoc", "1");
		const TopTools_ListOfShape & DirectLeft() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & Left() const;
		%feature("autodoc", "1");
		virtual		void Build();
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDeleted(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Modified(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		~BRepFeat_SplitShape();

};

%nodefaultctor BRepFeat_RibSlot;
class BRepFeat_RibSlot : public BRepBuilderAPI_MakeShape {
	public:
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDeleted(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Modified(const TopoDS_Shape &F);
		%feature("autodoc", "1");
		virtual		const TopTools_ListOfShape & Generated(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		const TopTools_ListOfShape & FirstShape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & LastShape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & FacesForDraft() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & NewEdges() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & TgtEdges() const;
		%feature("autodoc", "1");
		Standard_Real IntPar(const Handle_Geom_Curve &C, const gp_Pnt &P);
		%feature("autodoc", "1");
		TopoDS_Face ChoiceOfFaces(TopTools_ListOfShape & faces, const Handle_Geom_Curve &cc, const Standard_Real par, const Standard_Real bnd, const Handle_Geom_Plane &Pln);
		%feature("autodoc", "1");
		BRepFeat_StatusError CurrentStatusError() const;
		%feature("autodoc", "1");
		virtual		~BRepFeat_RibSlot();

};

%nodefaultctor BRepFeat_MakeLinearForm;
class BRepFeat_MakeLinearForm : public BRepFeat_RibSlot {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakeLinearForm();
		%feature("autodoc", "1");
		BRepFeat_MakeLinearForm(const TopoDS_Shape &Sbase, const TopoDS_Wire &W, const Handle_Geom_Plane &P, const gp_Vec &Direc, const gp_Vec &Direc1, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Wire &W, const Handle_Geom_Plane &P, const gp_Vec &Direction, const gp_Vec &Direction1, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Boolean Propagate(TopTools_ListOfShape & L, const TopoDS_Face &F, const gp_Pnt &FPoint, const gp_Pnt &LPoint, Standard_Boolean & falseside);
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakeLinearForm();

};

%nodefaultctor BRepFeat_MakeRevolutionForm;
class BRepFeat_MakeRevolutionForm : public BRepFeat_RibSlot {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakeRevolutionForm();
		%feature("autodoc", "1");
		BRepFeat_MakeRevolutionForm(const TopoDS_Shape &Sbase, const TopoDS_Wire &W, const Handle_Geom_Plane &P, const gp_Ax1 &Axis, const Standard_Real H1, const Standard_Real H2, const Standard_Integer Fuse, Standard_Boolean & Sliding);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Wire &W, const Handle_Geom_Plane &Plane, const gp_Ax1 &Axis, const Standard_Real Height1, const Standard_Real Height2, const Standard_Integer Fuse, Standard_Boolean & Sliding);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Boolean Propagate(TopTools_ListOfShape & L, const TopoDS_Face &F, const gp_Pnt &FPoint, const gp_Pnt &LPoint, Standard_Boolean & falseside);
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakeRevolutionForm();

};

%nodefaultctor BRepFeat_LocalOperation;
class BRepFeat_LocalOperation : public BRepFeat_Builder {
	public:
		%feature("autodoc", "1");
		BRepFeat_LocalOperation();
		%feature("autodoc", "1");
		BRepFeat_LocalOperation(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		BRepFeat_LocalOperation(const TopoDS_Shape &S, const TopoDS_Shape &T);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &T, const TopTools_ListOfShape &L, const Standard_Boolean Fuse);
		%feature("autodoc", "1");
		void Perform(const TopTools_ListOfShape &LS, const TopTools_ListOfShape &LT, const Standard_Boolean Fuse);
		%feature("autodoc", "1");
		void BuildPartsOfTool();
		%feature("autodoc", "1");
		const TopTools_ListOfShape & PartsOfTool() const;
		%feature("autodoc", "1");
		void RemovePart(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void ActivatePart(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		virtual		void Build();
		%feature("autodoc", "1");
		virtual		~BRepFeat_LocalOperation();

};

%nodefaultctor BRepFeat_MakeRevol;
class BRepFeat_MakeRevol : public BRepFeat_Form {
	public:
		%feature("autodoc", "1");
		BRepFeat_MakeRevol();
		%feature("autodoc", "1");
		BRepFeat_MakeRevol(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const gp_Ax1 &Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &Sbase, const TopoDS_Shape &Pbase, const TopoDS_Face &Skface, const gp_Ax1 &Axis, const Standard_Integer Fuse, const Standard_Boolean Modify);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E, const TopoDS_Face &OnFace);
		%feature("autodoc", "1");
		void Perform(const Standard_Real Angle);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Shape &From, const TopoDS_Shape &Until);
		%feature("autodoc", "1");
		void PerformThruAll();
		%feature("autodoc", "1");
		void PerformUntilAngle(const TopoDS_Shape &Until, const Standard_Real Angle);
		%feature("autodoc", "1");
		virtual		void Curves(TColGeom_SequenceOfCurve & S);
		%feature("autodoc", "1");
		virtual		Handle_Geom_Curve BarycCurve();
		%feature("autodoc", "1");
		virtual		~BRepFeat_MakeRevol();

};