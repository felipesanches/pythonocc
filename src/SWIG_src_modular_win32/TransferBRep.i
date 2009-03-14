/*

Copyright 2008-2009 Thomas Paviot (thomas.paviot@free.fr)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%module TransferBRep

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


%include TransferBRep_dependencies.i


%include TransferBRep_headers.i




%nodefaultctor Handle_TransferBRep_BinderOfShape;
class Handle_TransferBRep_BinderOfShape : public Handle_Transfer_Binder {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_BinderOfShape();
		%feature("autodoc", "1");
		Handle_TransferBRep_BinderOfShape(const Handle_TransferBRep_BinderOfShape &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_BinderOfShape(const TransferBRep_BinderOfShape *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_BinderOfShape const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_BinderOfShape {
	TransferBRep_BinderOfShape* GetObject() {
	return (TransferBRep_BinderOfShape*)$self->Access();
	}
};
%extend Handle_TransferBRep_BinderOfShape {
	~Handle_TransferBRep_BinderOfShape() {
	printf("Call custom destructor for instance of Handle_TransferBRep_BinderOfShape\n");
	}
};

%nodefaultctor Handle_TransferBRep_ShapeBinder;
class Handle_TransferBRep_ShapeBinder : public Handle_TransferBRep_BinderOfShape {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeBinder();
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeBinder(const Handle_TransferBRep_ShapeBinder &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeBinder(const TransferBRep_ShapeBinder *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeBinder const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_ShapeBinder {
	TransferBRep_ShapeBinder* GetObject() {
	return (TransferBRep_ShapeBinder*)$self->Access();
	}
};
%extend Handle_TransferBRep_ShapeBinder {
	~Handle_TransferBRep_ShapeBinder() {
	printf("Call custom destructor for instance of Handle_TransferBRep_ShapeBinder\n");
	}
};

%nodefaultctor Handle_TransferBRep_HSequenceOfTransferResultInfo;
class Handle_TransferBRep_HSequenceOfTransferResultInfo : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo();
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo(const Handle_TransferBRep_HSequenceOfTransferResultInfo &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo(const TransferBRep_HSequenceOfTransferResultInfo *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_HSequenceOfTransferResultInfo {
	TransferBRep_HSequenceOfTransferResultInfo* GetObject() {
	return (TransferBRep_HSequenceOfTransferResultInfo*)$self->Access();
	}
};
%extend Handle_TransferBRep_HSequenceOfTransferResultInfo {
	~Handle_TransferBRep_HSequenceOfTransferResultInfo() {
	printf("Call custom destructor for instance of Handle_TransferBRep_HSequenceOfTransferResultInfo\n");
	}
};

%nodefaultctor Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo;
class Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo();
		%feature("autodoc", "1");
		Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo(const Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo(const TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo {
	TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo* GetObject() {
	return (TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo*)$self->Access();
	}
};
%extend Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo {
	~Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo() {
	printf("Call custom destructor for instance of Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo\n");
	}
};

%nodefaultctor Handle_TransferBRep_ShapeListBinder;
class Handle_TransferBRep_ShapeListBinder : public Handle_Transfer_Binder {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeListBinder();
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeListBinder(const Handle_TransferBRep_ShapeListBinder &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeListBinder(const TransferBRep_ShapeListBinder *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeListBinder const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_ShapeListBinder {
	TransferBRep_ShapeListBinder* GetObject() {
	return (TransferBRep_ShapeListBinder*)$self->Access();
	}
};
%extend Handle_TransferBRep_ShapeListBinder {
	~Handle_TransferBRep_ShapeListBinder() {
	printf("Call custom destructor for instance of Handle_TransferBRep_ShapeListBinder\n");
	}
};

%nodefaultctor Handle_TransferBRep_ShapeMapper;
class Handle_TransferBRep_ShapeMapper : public Handle_Transfer_Finder {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeMapper();
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeMapper(const Handle_TransferBRep_ShapeMapper &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeMapper(const TransferBRep_ShapeMapper *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeMapper const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_ShapeMapper {
	TransferBRep_ShapeMapper* GetObject() {
	return (TransferBRep_ShapeMapper*)$self->Access();
	}
};
%extend Handle_TransferBRep_ShapeMapper {
	~Handle_TransferBRep_ShapeMapper() {
	printf("Call custom destructor for instance of Handle_TransferBRep_ShapeMapper\n");
	}
};

%nodefaultctor Handle_TransferBRep_TransferResultInfo;
class Handle_TransferBRep_TransferResultInfo : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo();
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo(const Handle_TransferBRep_TransferResultInfo &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo(const TransferBRep_TransferResultInfo *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_TransferResultInfo {
	TransferBRep_TransferResultInfo* GetObject() {
	return (TransferBRep_TransferResultInfo*)$self->Access();
	}
};
%extend Handle_TransferBRep_TransferResultInfo {
	~Handle_TransferBRep_TransferResultInfo() {
	printf("Call custom destructor for instance of Handle_TransferBRep_TransferResultInfo\n");
	}
};

%nodefaultctor Handle_TransferBRep_OrientedShapeMapper;
class Handle_TransferBRep_OrientedShapeMapper : public Handle_Transfer_Finder {
	public:
		%feature("autodoc", "1");
		Handle_TransferBRep_OrientedShapeMapper();
		%feature("autodoc", "1");
		Handle_TransferBRep_OrientedShapeMapper(const Handle_TransferBRep_OrientedShapeMapper &aHandle);
		%feature("autodoc", "1");
		Handle_TransferBRep_OrientedShapeMapper(const TransferBRep_OrientedShapeMapper *anItem);
		%feature("autodoc", "1");
		Handle_TransferBRep_OrientedShapeMapper const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TransferBRep_OrientedShapeMapper {
	TransferBRep_OrientedShapeMapper* GetObject() {
	return (TransferBRep_OrientedShapeMapper*)$self->Access();
	}
};
%extend Handle_TransferBRep_OrientedShapeMapper {
	~Handle_TransferBRep_OrientedShapeMapper() {
	printf("Call custom destructor for instance of Handle_TransferBRep_OrientedShapeMapper\n");
	}
};

%nodefaultctor TransferBRep_Reader;
class TransferBRep_Reader {
	public:
		%feature("autodoc", "1");
		TransferBRep_Reader();
		%feature("autodoc", "1");
		void SetProtocol(const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		virtual		Handle_Interface_Protocol Protocol() const;
		%feature("autodoc", "1");
		void SetActor(const Handle_Transfer_ActorOfTransientProcess &actor);
		%feature("autodoc", "1");
		virtual		Handle_Transfer_ActorOfTransientProcess Actor() const;
		%feature("autodoc", "1");
		void SetFileStatus(const Standard_Integer status);
		%feature("autodoc", "1");
		Standard_Integer FileStatus() const;
		%feature("autodoc", "1");
		Standard_Boolean FileNotFound() const;
		%feature("autodoc", "1");
		Standard_Boolean SyntaxError() const;
		%feature("autodoc", "1");
		void SetModel(const Handle_Interface_InterfaceModel &model);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean CheckStatusModel(const Standard_Boolean withprint) const;
		%feature("autodoc", "1");
		Interface_CheckIterator CheckListModel() const;
		%feature("autodoc", "1");
		Standard_Boolean & ModeNewTransfer();
		%feature("autodoc", "1");
		Standard_Boolean BeginTransfer();
		%feature("autodoc", "1");
		void EndTransfer();
		%feature("autodoc", "1");
		virtual		void PrepareTransfer();
		%feature("autodoc", "1");
		virtual		void TransferRoots();
		%feature("autodoc", "1");
		virtual		Standard_Boolean Transfer(const Standard_Integer num);
		%feature("autodoc", "1");
		virtual		void TransferList(const Handle_TColStd_HSequenceOfTransient &list);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbShapes() const;
		%feature("autodoc", "1");
		Handle_TopTools_HSequenceOfShape Shapes() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & Shape(const Standard_Integer num=1) const;
		%feature("autodoc", "1");
		TopoDS_Shape ShapeResult(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		TopoDS_Shape OneShape() const;
		%feature("autodoc", "1");
		Standard_Integer NbTransients() const;
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfTransient Transients() const;
		%feature("autodoc", "1");
		Handle_Standard_Transient Transient(const Standard_Integer num=1) const;
		%feature("autodoc", "1");
		Standard_Boolean CheckStatusResult(const Standard_Boolean withprints) const;
		%feature("autodoc", "1");
		Interface_CheckIterator CheckListResult() const;
		%feature("autodoc", "1");
		Handle_Transfer_TransientProcess TransientProcess() const;
		%feature("autodoc", "1");
		virtual		void Destroy();

};
%extend TransferBRep_Reader {
	~TransferBRep_Reader() {
	printf("Call custom destructor for instance of TransferBRep_Reader\n");
	}
};

%nodefaultctor TransferBRep_TransferResultInfo;
class TransferBRep_TransferResultInfo : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TransferBRep_TransferResultInfo();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Integer & Result();
		%feature("autodoc", "1");
		Standard_Integer & ResultWarning();
		%feature("autodoc", "1");
		Standard_Integer & ResultFail();
		%feature("autodoc", "1");
		Standard_Integer & ResultWarningFail();
		%feature("autodoc", "1");
		Standard_Integer & NoResult();
		%feature("autodoc", "1");
		Standard_Integer & NoResultWarning();
		%feature("autodoc", "1");
		Standard_Integer & NoResultFail();
		%feature("autodoc", "1");
		Standard_Integer & NoResultWarningFail();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_TransferResultInfo {
	Handle_TransferBRep_TransferResultInfo GetHandle() {
	return *(Handle_TransferBRep_TransferResultInfo*) &$self;
	}
};
%extend TransferBRep_TransferResultInfo {
	~TransferBRep_TransferResultInfo() {
	printf("Call custom destructor for instance of TransferBRep_TransferResultInfo\n");
	}
};

%nodefaultctor TransferBRep_OrientedShapeMapper;
class TransferBRep_OrientedShapeMapper : public Transfer_Finder {
	public:
		%feature("autodoc", "1");
		TransferBRep_OrientedShapeMapper(const TopoDS_Shape &akey);
		%feature("autodoc", "1");
		const TopoDS_Shape & Value() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Equates(const Handle_Transfer_Finder &other) const;
		%feature("autodoc", "1");
		virtual		Handle_Standard_Type ValueType() const;
		%feature("autodoc", "1");
		virtual		Standard_CString ValueTypeName() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_OrientedShapeMapper {
	Handle_TransferBRep_OrientedShapeMapper GetHandle() {
	return *(Handle_TransferBRep_OrientedShapeMapper*) &$self;
	}
};
%extend TransferBRep_OrientedShapeMapper {
	~TransferBRep_OrientedShapeMapper() {
	printf("Call custom destructor for instance of TransferBRep_OrientedShapeMapper\n");
	}
};

%nodefaultctor TransferBRep_BinderOfShape;
class TransferBRep_BinderOfShape : public Transfer_Binder {
	public:
		%feature("autodoc", "1");
		TransferBRep_BinderOfShape();
		%feature("autodoc", "1");
		TransferBRep_BinderOfShape(const TopoDS_Shape &res);
		%feature("autodoc", "1");
		virtual		Handle_Standard_Type ResultType() const;
		%feature("autodoc", "1");
		virtual		Standard_CString ResultTypeName() const;
		%feature("autodoc", "1");
		void SetResult(const TopoDS_Shape &res);
		%feature("autodoc", "1");
		const TopoDS_Shape & Result() const;
		%feature("autodoc", "1");
		TopoDS_Shape & CResult();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_BinderOfShape {
	Handle_TransferBRep_BinderOfShape GetHandle() {
	return *(Handle_TransferBRep_BinderOfShape*) &$self;
	}
};
%extend TransferBRep_BinderOfShape {
	~TransferBRep_BinderOfShape() {
	printf("Call custom destructor for instance of TransferBRep_BinderOfShape\n");
	}
};

%nodefaultctor TransferBRep_ShapeBinder;
class TransferBRep_ShapeBinder : public TransferBRep_BinderOfShape {
	public:
		%feature("autodoc", "1");
		TransferBRep_ShapeBinder();
		%feature("autodoc", "1");
		TransferBRep_ShapeBinder(const TopoDS_Shape &res);
		%feature("autodoc", "1");
		TopAbs_ShapeEnum ShapeType() const;
		%feature("autodoc", "1");
		TopoDS_Vertex Vertex() const;
		%feature("autodoc", "1");
		TopoDS_Edge Edge() const;
		%feature("autodoc", "1");
		TopoDS_Wire Wire() const;
		%feature("autodoc", "1");
		TopoDS_Face Face() const;
		%feature("autodoc", "1");
		TopoDS_Shell Shell() const;
		%feature("autodoc", "1");
		TopoDS_Solid Solid() const;
		%feature("autodoc", "1");
		TopoDS_CompSolid CompSolid() const;
		%feature("autodoc", "1");
		TopoDS_Compound Compound() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_ShapeBinder {
	Handle_TransferBRep_ShapeBinder GetHandle() {
	return *(Handle_TransferBRep_ShapeBinder*) &$self;
	}
};
%extend TransferBRep_ShapeBinder {
	~TransferBRep_ShapeBinder() {
	printf("Call custom destructor for instance of TransferBRep_ShapeBinder\n");
	}
};

%nodefaultctor TransferBRep_HSequenceOfTransferResultInfo;
class TransferBRep_HSequenceOfTransferResultInfo : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TransferBRep_HSequenceOfTransferResultInfo();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_TransferBRep_TransferResultInfo &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TransferBRep_HSequenceOfTransferResultInfo &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_TransferBRep_TransferResultInfo &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TransferBRep_HSequenceOfTransferResultInfo &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TransferBRep_TransferResultInfo &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TransferBRep_HSequenceOfTransferResultInfo &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TransferBRep_TransferResultInfo &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TransferBRep_HSequenceOfTransferResultInfo &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_TransferBRep_TransferResultInfo &anItem);
		%feature("autodoc", "1");
		const Handle_TransferBRep_TransferResultInfo & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TransferBRep_SequenceOfTransferResultInfo & Sequence() const;
		%feature("autodoc", "1");
		TransferBRep_SequenceOfTransferResultInfo & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TransferBRep_HSequenceOfTransferResultInfo ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_HSequenceOfTransferResultInfo {
	Handle_TransferBRep_HSequenceOfTransferResultInfo GetHandle() {
	return *(Handle_TransferBRep_HSequenceOfTransferResultInfo*) &$self;
	}
};
%extend TransferBRep_HSequenceOfTransferResultInfo {
	~TransferBRep_HSequenceOfTransferResultInfo() {
	printf("Call custom destructor for instance of TransferBRep_HSequenceOfTransferResultInfo\n");
	}
};

%nodefaultctor TransferBRep_ShapeInfo;
class TransferBRep_ShapeInfo {
	public:
		%feature("autodoc", "1");
		TransferBRep_ShapeInfo();
		%feature("autodoc", "1");
		Handle_Standard_Type Type(const TopoDS_Shape &ent);
		%feature("autodoc", "1");
		char * TypeName(const TopoDS_Shape &ent);

};
%extend TransferBRep_ShapeInfo {
	~TransferBRep_ShapeInfo() {
	printf("Call custom destructor for instance of TransferBRep_ShapeInfo\n");
	}
};

%nodefaultctor TransferBRep_SequenceOfTransferResultInfo;
class TransferBRep_SequenceOfTransferResultInfo : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TransferBRep_SequenceOfTransferResultInfo();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const TransferBRep_SequenceOfTransferResultInfo & Assign(const TransferBRep_SequenceOfTransferResultInfo &Other);
		%feature("autodoc", "1");
		void Append(const Handle_TransferBRep_TransferResultInfo &T);
		%feature("autodoc", "1");
		void Append(TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_TransferBRep_TransferResultInfo &T);
		%feature("autodoc", "1");
		void Prepend(TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_TransferBRep_TransferResultInfo &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_TransferBRep_TransferResultInfo &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("autodoc", "1");
		const Handle_TransferBRep_TransferResultInfo & First() const;
		%feature("autodoc", "1");
		const Handle_TransferBRep_TransferResultInfo & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TransferBRep_SequenceOfTransferResultInfo & S);
		%feature("autodoc", "1");
		const Handle_TransferBRep_TransferResultInfo & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TransferBRep_TransferResultInfo & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TransferBRep_TransferResultInfo &I);
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend TransferBRep_SequenceOfTransferResultInfo {
	~TransferBRep_SequenceOfTransferResultInfo() {
	printf("Call custom destructor for instance of TransferBRep_SequenceOfTransferResultInfo\n");
	}
};

%nodefaultctor TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo;
class TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo(const Handle_TransferBRep_TransferResultInfo &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_TransferBRep_TransferResultInfo & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo {
	Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo GetHandle() {
	return *(Handle_TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo*) &$self;
	}
};
%extend TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo {
	~TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo() {
	printf("Call custom destructor for instance of TransferBRep_SequenceNodeOfSequenceOfTransferResultInfo\n");
	}
};

%nodefaultctor TransferBRep_ShapeListBinder;
class TransferBRep_ShapeListBinder : public Transfer_Binder {
	public:
		%feature("autodoc", "1");
		TransferBRep_ShapeListBinder();
		%feature("autodoc", "1");
		TransferBRep_ShapeListBinder(const Handle_TopTools_HSequenceOfShape &list);
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsMultiple() const;
		%feature("autodoc", "1");
		virtual		Handle_Standard_Type ResultType() const;
		%feature("autodoc", "1");
		virtual		Standard_CString ResultTypeName() const;
		%feature("autodoc", "1");
		void AddResult(const TopoDS_Shape &res);
		%feature("autodoc", "1");
		Handle_TopTools_HSequenceOfShape Result() const;
		%feature("autodoc", "1");
		void SetResult(const Standard_Integer num, const TopoDS_Shape &res);
		%feature("autodoc", "1");
		Standard_Integer NbShapes() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & Shape(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopAbs_ShapeEnum ShapeType(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Vertex Vertex(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Edge Edge(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Wire Wire(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Face Face(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Shell Shell(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Solid Solid(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_CompSolid CompSolid(const Standard_Integer num) const;
		%feature("autodoc", "1");
		TopoDS_Compound Compound(const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TransferBRep_ShapeListBinder {
	Handle_TransferBRep_ShapeListBinder GetHandle() {
	return *(Handle_TransferBRep_ShapeListBinder*) &$self;
	}
};
%extend TransferBRep_ShapeListBinder {
	~TransferBRep_ShapeListBinder() {
	printf("Call custom destructor for instance of TransferBRep_ShapeListBinder\n");
	}
};

%nodefaultctor TransferBRep;
class TransferBRep {
	public:
		%feature("autodoc", "1");
		TransferBRep();
		%feature("autodoc", "1");
		TopoDS_Shape ShapeResult(const Handle_Transfer_Binder &binder);
		%feature("autodoc", "1");
		TopoDS_Shape ShapeResult(const Handle_Transfer_TransientProcess &TP, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void SetShapeResult(const Handle_Transfer_TransientProcess &TP, const Handle_Standard_Transient &ent, const TopoDS_Shape &result);
		%feature("autodoc", "1");
		Handle_TopTools_HSequenceOfShape Shapes(const Handle_Transfer_TransientProcess &TP, const Standard_Boolean rootsonly=1);
		%feature("autodoc", "1");
		Handle_TopTools_HSequenceOfShape Shapes(const Handle_Transfer_TransientProcess &TP, const Handle_TColStd_HSequenceOfTransient &list);
		%feature("autodoc", "1");
		TopAbs_Orientation ShapeState(const Handle_Transfer_FinderProcess &FP, const TopoDS_Shape &shape);
		%feature("autodoc", "1");
		Handle_Transfer_Binder ResultFromShape(const Handle_Transfer_FinderProcess &FP, const TopoDS_Shape &shape);
		%feature("autodoc", "1");
		Handle_Standard_Transient TransientFromShape(const Handle_Transfer_FinderProcess &FP, const TopoDS_Shape &shape);
		%feature("autodoc", "1");
		void SetTransientFromShape(const Handle_Transfer_FinderProcess &FP, const TopoDS_Shape &shape, const Handle_Standard_Transient &result);
		%feature("autodoc", "1");
		Handle_TransferBRep_ShapeMapper ShapeMapper(const Handle_Transfer_FinderProcess &FP, const TopoDS_Shape &shape);
		%feature("autodoc", "1");
		void TransferResultInfo(const Handle_Transfer_TransientProcess &TP, const Handle_TColStd_HSequenceOfTransient &EntityTypes, Handle_TransferBRep_HSequenceOfTransferResultInfo & InfoSeq);
		%feature("autodoc", "1");
		void TransferResultInfo(const Handle_Transfer_FinderProcess &FP, const Handle_TColStd_HSequenceOfInteger &ShapeTypes, Handle_TransferBRep_HSequenceOfTransferResultInfo & InfoSeq);
		%feature("autodoc", "1");
		void PrintResultInfo(const Handle_Message_Printer &Printer, const Message_Msg &Header, const Handle_TransferBRep_TransferResultInfo &ResultInfo, const Standard_Boolean printEmpty=1);
		%feature("autodoc", "1");
		Interface_CheckIterator ResultCheckList(const Interface_CheckIterator &chl, const Handle_Transfer_FinderProcess &FP, const Handle_Interface_InterfaceModel &model);
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfTransient Checked(const Interface_CheckIterator &chl, const Standard_Boolean alsoshapes=0);
		%feature("autodoc", "1");
		Handle_TopTools_HSequenceOfShape CheckedShapes(const Interface_CheckIterator &chl);
		%feature("autodoc", "1");
		Interface_CheckIterator CheckObject(const Interface_CheckIterator &chl, const Handle_Standard_Transient &obj);

};
%extend TransferBRep {
	~TransferBRep() {
	printf("Call custom destructor for instance of TransferBRep\n");
	}
};