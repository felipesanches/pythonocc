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
%module Draft

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


%include Draft_dependencies.i


%include Draft_headers.i


enum Draft_ErrorStatus {
	Draft_NoError,
	Draft_FaceRecomputation,
	Draft_EdgeRecomputation,
	Draft_VertexRecomputation,
	};



%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo &aHandle);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const Draft_DataMapNodeOfDataMapOfFaceFaceInfo *anItem);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	Draft_DataMapNodeOfDataMapOfFaceFaceInfo* GetObject() {
	return (Draft_DataMapNodeOfDataMapOfFaceFaceInfo*)$self->Access();
	}
};

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo &aHandle);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo *anItem);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo* GetObject() {
	return (Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo*)$self->Access();
	}
};

%nodefaultctor Handle_Draft_Modification;
class Handle_Draft_Modification : public Handle_BRepTools_Modification {
	public:
		%feature("autodoc", "1");
		~Handle_Draft_Modification();
		%feature("autodoc", "1");
		Handle_Draft_Modification();
		%feature("autodoc", "1");
		Handle_Draft_Modification(const Handle_Draft_Modification &aHandle);
		%feature("autodoc", "1");
		Handle_Draft_Modification(const Draft_Modification *anItem);
		%feature("autodoc", "1");
		Handle_Draft_Modification const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_Modification {
	Draft_Modification* GetObject() {
	return (Draft_Modification*)$self->Access();
	}
};

%nodefaultctor Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo();
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo &aHandle);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const Draft_DataMapNodeOfDataMapOfVertexVertexInfo *anItem);
		%feature("autodoc", "1");
		Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	Draft_DataMapNodeOfDataMapOfVertexVertexInfo* GetObject() {
	return (Draft_DataMapNodeOfDataMapOfVertexVertexInfo*)$self->Access();
	}
};

%nodefaultctor Draft_FaceInfo;
class Draft_FaceInfo {
	public:
		%feature("autodoc", "1");
		~Draft_FaceInfo();
		%feature("autodoc", "1");
		Draft_FaceInfo();
		%feature("autodoc", "1");
		Draft_FaceInfo(const Handle_Geom_Surface &S, const Standard_Boolean HasNewGeometry);
		%feature("autodoc", "1");
		void RootFace(const TopoDS_Face &F);
		%feature("autodoc", "1");
		Standard_Boolean NewGeometry() const;
		%feature("autodoc", "1");
		void Add(const TopoDS_Face &F);
		%feature("autodoc", "1");
		const TopoDS_Face & FirstFace() const;
		%feature("autodoc", "1");
		const TopoDS_Face & SecondFace() const;
		%feature("autodoc", "1");
		const Handle_Geom_Surface & Geometry() const;
		%feature("autodoc", "1");
		Handle_Geom_Surface & ChangeGeometry();
		%feature("autodoc", "1");
		const TopoDS_Face & RootFace() const;
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeCurve();
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Curve() const;

};

%nodefaultctor Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo(const TopoDS_Edge &K, const Draft_EdgeInfo &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopoDS_Edge & Key() const;
		%feature("autodoc", "1");
		Draft_EdgeInfo & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo();

};
%extend Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo {
	Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfEdgeEdgeInfo*) &$self;
	}
};

%nodefaultctor Draft;
class Draft {
	public:
		%feature("autodoc", "1");
		~Draft();
		%feature("autodoc", "1");
		Draft();
		%feature("autodoc", "1");
		Standard_Real Angle(const TopoDS_Face &F, const gp_Dir &Direction);

};

%nodefaultctor Draft_DataMapIteratorOfDataMapOfFaceFaceInfo;
class Draft_DataMapIteratorOfDataMapOfFaceFaceInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~Draft_DataMapIteratorOfDataMapOfFaceFaceInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfFaceFaceInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfFaceFaceInfo(const Draft_DataMapOfFaceFaceInfo &aMap);
		%feature("autodoc", "1");
		void Initialize(const Draft_DataMapOfFaceFaceInfo &aMap);
		%feature("autodoc", "1");
		const TopoDS_Face & Key() const;
		%feature("autodoc", "1");
		const Draft_FaceInfo & Value() const;

};

%nodefaultctor Draft_DataMapNodeOfDataMapOfVertexVertexInfo;
class Draft_DataMapNodeOfDataMapOfVertexVertexInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Draft_DataMapNodeOfDataMapOfVertexVertexInfo(const TopoDS_Vertex &K, const Draft_VertexInfo &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopoDS_Vertex & Key() const;
		%feature("autodoc", "1");
		Draft_VertexInfo & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Draft_DataMapNodeOfDataMapOfVertexVertexInfo();

};
%extend Draft_DataMapNodeOfDataMapOfVertexVertexInfo {
	Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfVertexVertexInfo*) &$self;
	}
};

%nodefaultctor Draft_DataMapOfFaceFaceInfo;
class Draft_DataMapOfFaceFaceInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Draft_DataMapOfFaceFaceInfo(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Draft_DataMapOfFaceFaceInfo & Assign(const Draft_DataMapOfFaceFaceInfo &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~Draft_DataMapOfFaceFaceInfo();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TopoDS_Face &K, const Draft_FaceInfo &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TopoDS_Face &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TopoDS_Face &K);
		%feature("autodoc", "1");
		const Draft_FaceInfo & Find(const TopoDS_Face &K) const;
		%feature("autodoc", "1");
		const Draft_FaceInfo & operator()(const TopoDS_Face &K) const;
		%feature("autodoc", "1");
		Draft_FaceInfo & ChangeFind(const TopoDS_Face &K);
		%feature("autodoc", "1");
		Draft_FaceInfo & operator()(const TopoDS_Face &K);

};

%nodefaultctor Draft_DataMapIteratorOfDataMapOfVertexVertexInfo;
class Draft_DataMapIteratorOfDataMapOfVertexVertexInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~Draft_DataMapIteratorOfDataMapOfVertexVertexInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfVertexVertexInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfVertexVertexInfo(const Draft_DataMapOfVertexVertexInfo &aMap);
		%feature("autodoc", "1");
		void Initialize(const Draft_DataMapOfVertexVertexInfo &aMap);
		%feature("autodoc", "1");
		const TopoDS_Vertex & Key() const;
		%feature("autodoc", "1");
		const Draft_VertexInfo & Value() const;

};

%nodefaultctor Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo;
class Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo();
		%feature("autodoc", "1");
		Draft_DataMapIteratorOfDataMapOfEdgeEdgeInfo(const Draft_DataMapOfEdgeEdgeInfo &aMap);
		%feature("autodoc", "1");
		void Initialize(const Draft_DataMapOfEdgeEdgeInfo &aMap);
		%feature("autodoc", "1");
		const TopoDS_Edge & Key() const;
		%feature("autodoc", "1");
		const Draft_EdgeInfo & Value() const;

};

%nodefaultctor Draft_VertexInfo;
class Draft_VertexInfo {
	public:
		%feature("autodoc", "1");
		~Draft_VertexInfo();
		%feature("autodoc", "1");
		Draft_VertexInfo();
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		const gp_Pnt & Geometry() const;
		%feature("autodoc", "1");
		Standard_Real Parameter(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void InitEdgeIterator();
		%feature("autodoc", "1");
		const TopoDS_Edge & Edge() const;
		%feature("autodoc", "1");
		void NextEdge();
		%feature("autodoc", "1");
		Standard_Boolean MoreEdge() const;
		%feature("autodoc", "1");
		gp_Pnt & ChangeGeometry();
		%feature("autodoc", "1");
		Standard_Real & ChangeParameter(const TopoDS_Edge &E);

};

%nodefaultctor Draft_DataMapNodeOfDataMapOfFaceFaceInfo;
class Draft_DataMapNodeOfDataMapOfFaceFaceInfo : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Draft_DataMapNodeOfDataMapOfFaceFaceInfo(const TopoDS_Face &K, const Draft_FaceInfo &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopoDS_Face & Key() const;
		%feature("autodoc", "1");
		Draft_FaceInfo & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Draft_DataMapNodeOfDataMapOfFaceFaceInfo();

};
%extend Draft_DataMapNodeOfDataMapOfFaceFaceInfo {
	Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo GetHandle() {
	return *(Handle_Draft_DataMapNodeOfDataMapOfFaceFaceInfo*) &$self;
	}
};

%nodefaultctor Draft_DataMapOfEdgeEdgeInfo;
class Draft_DataMapOfEdgeEdgeInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Draft_DataMapOfEdgeEdgeInfo(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Draft_DataMapOfEdgeEdgeInfo & Assign(const Draft_DataMapOfEdgeEdgeInfo &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~Draft_DataMapOfEdgeEdgeInfo();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TopoDS_Edge &K, const Draft_EdgeInfo &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TopoDS_Edge &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TopoDS_Edge &K);
		%feature("autodoc", "1");
		const Draft_EdgeInfo & Find(const TopoDS_Edge &K) const;
		%feature("autodoc", "1");
		const Draft_EdgeInfo & operator()(const TopoDS_Edge &K) const;
		%feature("autodoc", "1");
		Draft_EdgeInfo & ChangeFind(const TopoDS_Edge &K);
		%feature("autodoc", "1");
		Draft_EdgeInfo & operator()(const TopoDS_Edge &K);

};

%nodefaultctor Draft_Modification;
class Draft_Modification : public BRepTools_Modification {
	public:
		%feature("autodoc", "1");
		Draft_Modification(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		Standard_Boolean Add(const TopoDS_Face &F, const gp_Dir &Direction, const Standard_Real Angle, const gp_Pln &NeutralPlane, const Standard_Boolean Flag=1);
		%feature("autodoc", "1");
		void Remove(const TopoDS_Face &F);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Draft_ErrorStatus Error() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & ProblematicShape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & ConnectedFaces(const TopoDS_Face &F);
		%feature("autodoc", "1");
		const TopTools_ListOfShape & ModifiedFaces();
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewSurface(const TopoDS_Face &F, Handle_Geom_Surface & S, TopLoc_Location & L, Standard_Real &OutValue, Standard_Boolean & RevWires, Standard_Boolean & RevFace);
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewCurve(const TopoDS_Edge &E, Handle_Geom_Curve & C, TopLoc_Location & L, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewPoint(const TopoDS_Vertex &V, gp_Pnt & P, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewCurve2d(const TopoDS_Edge &E, const TopoDS_Face &F, const TopoDS_Edge &NewE, const TopoDS_Face &NewF, Handle_Geom2d_Curve & C, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewParameter(const TopoDS_Vertex &V, const TopoDS_Edge &E, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		GeomAbs_Shape Continuity(const TopoDS_Edge &E, const TopoDS_Face &F1, const TopoDS_Face &F2, const TopoDS_Edge &NewE, const TopoDS_Face &NewF1, const TopoDS_Face &NewF2);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~Draft_Modification();

};
%extend Draft_Modification {
	Handle_Draft_Modification GetHandle() {
	return *(Handle_Draft_Modification*) &$self;
	}
};

%nodefaultctor Draft_EdgeInfo;
class Draft_EdgeInfo {
	public:
		%feature("autodoc", "1");
		~Draft_EdgeInfo();
		%feature("autodoc", "1");
		Draft_EdgeInfo();
		%feature("autodoc", "1");
		Draft_EdgeInfo(const Standard_Boolean HasNewGeometry);
		%feature("autodoc", "1");
		void Add(const TopoDS_Face &F);
		%feature("autodoc", "1");
		void RootFace(const TopoDS_Face &F);
		%feature("autodoc", "1");
		void Tangent(const gp_Pnt &P);
		%feature("autodoc", "1");
		Standard_Boolean IsTangent(gp_Pnt & P) const;
		%feature("autodoc", "1");
		Standard_Boolean NewGeometry() const;
		%feature("autodoc", "1");
		void SetNewGeometry(const Standard_Boolean NewGeom);
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Geometry() const;
		%feature("autodoc", "1");
		const TopoDS_Face & FirstFace() const;
		%feature("autodoc", "1");
		const TopoDS_Face & SecondFace() const;
		%feature("autodoc", "1");
		const Handle_Geom2d_Curve & FirstPC() const;
		%feature("autodoc", "1");
		const Handle_Geom2d_Curve & SecondPC() const;
		%feature("autodoc", "1");
		Handle_Geom_Curve & ChangeGeometry();
		%feature("autodoc", "1");
		Handle_Geom2d_Curve & ChangeFirstPC();
		%feature("autodoc", "1");
		Handle_Geom2d_Curve & ChangeSecondPC();
		%feature("autodoc", "1");
		const TopoDS_Face & RootFace() const;
		%feature("autodoc", "1");
		void Tolerance(const Standard_Real tol);
		%feature("autodoc", "1");
		Standard_Real Tolerance() const;

};

%nodefaultctor Draft_DataMapOfVertexVertexInfo;
class Draft_DataMapOfVertexVertexInfo : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Draft_DataMapOfVertexVertexInfo(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Draft_DataMapOfVertexVertexInfo & Assign(const Draft_DataMapOfVertexVertexInfo &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~Draft_DataMapOfVertexVertexInfo();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TopoDS_Vertex &K, const Draft_VertexInfo &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TopoDS_Vertex &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TopoDS_Vertex &K);
		%feature("autodoc", "1");
		const Draft_VertexInfo & Find(const TopoDS_Vertex &K) const;
		%feature("autodoc", "1");
		const Draft_VertexInfo & operator()(const TopoDS_Vertex &K) const;
		%feature("autodoc", "1");
		Draft_VertexInfo & ChangeFind(const TopoDS_Vertex &K);
		%feature("autodoc", "1");
		Draft_VertexInfo & operator()(const TopoDS_Vertex &K);

};