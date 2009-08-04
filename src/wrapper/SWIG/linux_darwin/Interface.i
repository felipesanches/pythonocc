/*

Copyright 2008-2009 Thomas Paviot (tpaviot@gmail.com)

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
%module Interface

%include Interface_renames.i

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i
%include std_list.i
%include std_string.i
%include <python/std_basic_string.i>

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

/*
Standard_Integer & function transformation
*/
%typemap(argout) Standard_Integer &OutValue {
    PyObject *o, *o2, *o3;
    o = PyInt_FromLong(*$1);
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

%typemap(in,numinputs=0) Standard_Integer &OutValue(Standard_Integer temp) {
    $1 = &temp;
}

/*
Renaming operator = that can't be wrapped in Python
*/
%rename(Set) *::operator=;


%include Interface_dependencies.i


%include Interface_headers.i

typedef NCollection_Vector<Interface_FileParameter> Interface_VectorOfFileParameter;

enum Interface_ParamType {
	Interface_ParamMisc,
	Interface_ParamInteger,
	Interface_ParamReal,
	Interface_ParamIdent,
	Interface_ParamVoid,
	Interface_ParamText,
	Interface_ParamEnum,
	Interface_ParamLogical,
	Interface_ParamSub,
	Interface_ParamHexa,
	Interface_ParamBinary,
	};

enum Interface_DataState {
	Interface_StateOK,
	Interface_LoadWarning,
	Interface_LoadFail,
	Interface_DataWarning,
	Interface_DataFail,
	Interface_StateUnloaded,
	Interface_StateUnknown,
	};

enum Interface_CheckStatus {
	Interface_CheckOK,
	Interface_CheckWarning,
	Interface_CheckFail,
	Interface_CheckAny,
	Interface_CheckMessage,
	Interface_CheckNoFail,
	};



%nodefaultctor Handle_Interface_EntityCluster;
class Handle_Interface_EntityCluster : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster();
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster(const Handle_Interface_EntityCluster &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster(const Interface_EntityCluster *anItem);
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster & operator=(const Handle_Interface_EntityCluster &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster & operator=(const Interface_EntityCluster *anItem);
		%feature("autodoc", "1");
		Handle_Interface_EntityCluster const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_EntityCluster {
	Interface_EntityCluster* GetObject() {
	return (Interface_EntityCluster*)$self->Access();
	}
};
%extend Handle_Interface_EntityCluster {
	~Handle_Interface_EntityCluster() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_EntityCluster\n");}
	}
};


%nodefaultctor Handle_Interface_ReportEntity;
class Handle_Interface_ReportEntity : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity();
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity(const Handle_Interface_ReportEntity &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity(const Interface_ReportEntity *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity & operator=(const Handle_Interface_ReportEntity &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity & operator=(const Interface_ReportEntity *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ReportEntity {
	Interface_ReportEntity* GetObject() {
	return (Interface_ReportEntity*)$self->Access();
	}
};
%extend Handle_Interface_ReportEntity {
	~Handle_Interface_ReportEntity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_ReportEntity\n");}
	}
};


%nodefaultctor Handle_Interface_GlobalNodeOfReaderLib;
class Handle_Interface_GlobalNodeOfReaderLib : public Handle_Standard_Transient {
	public:
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib();
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib(const Handle_Interface_GlobalNodeOfReaderLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib(const Interface_GlobalNodeOfReaderLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib & operator=(const Handle_Interface_GlobalNodeOfReaderLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib & operator=(const Interface_GlobalNodeOfReaderLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfReaderLib const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GlobalNodeOfReaderLib {
	Interface_GlobalNodeOfReaderLib* GetObject() {
	return (Interface_GlobalNodeOfReaderLib*)$self->Access();
	}
};
%extend Handle_Interface_GlobalNodeOfReaderLib {
	~Handle_Interface_GlobalNodeOfReaderLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_GlobalNodeOfReaderLib\n");}
	}
};


%nodefaultctor Handle_Interface_ParamSet;
class Handle_Interface_ParamSet : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_ParamSet();
		%feature("autodoc", "1");
		Handle_Interface_ParamSet(const Handle_Interface_ParamSet &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ParamSet(const Interface_ParamSet *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ParamSet & operator=(const Handle_Interface_ParamSet &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ParamSet & operator=(const Interface_ParamSet *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ParamSet const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ParamSet {
	Interface_ParamSet* GetObject() {
	return (Interface_ParamSet*)$self->Access();
	}
};
%extend Handle_Interface_ParamSet {
	~Handle_Interface_ParamSet() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_ParamSet\n");}
	}
};


%nodefaultctor Handle_Interface_ParamList;
class Handle_Interface_ParamList : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_ParamList();
		%feature("autodoc", "1");
		Handle_Interface_ParamList(const Handle_Interface_ParamList &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ParamList(const Interface_ParamList *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ParamList & operator=(const Handle_Interface_ParamList &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ParamList & operator=(const Interface_ParamList *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ParamList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ParamList {
	Interface_ParamList* GetObject() {
	return (Interface_ParamList*)$self->Access();
	}
};
%extend Handle_Interface_ParamList {
	~Handle_Interface_ParamList() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_ParamList\n");}
	}
};


%nodefaultctor Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient;
class Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient();
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient(const Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient(const Interface_DataMapNodeOfDataMapOfIntegerTransient *anItem);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient & operator=(const Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient & operator=(const Interface_DataMapNodeOfDataMapOfIntegerTransient *anItem);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient {
	Interface_DataMapNodeOfDataMapOfIntegerTransient* GetObject() {
	return (Interface_DataMapNodeOfDataMapOfIntegerTransient*)$self->Access();
	}
};
%extend Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient {
	~Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient\n");}
	}
};


%nodefaultctor Handle_Interface_InterfaceError;
class Handle_Interface_InterfaceError : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError();
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError(const Handle_Interface_InterfaceError &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError(const Interface_InterfaceError *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError & operator=(const Handle_Interface_InterfaceError &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError & operator=(const Interface_InterfaceError *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_InterfaceError {
	Interface_InterfaceError* GetObject() {
	return (Interface_InterfaceError*)$self->Access();
	}
};
%extend Handle_Interface_InterfaceError {
	~Handle_Interface_InterfaceError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_InterfaceError\n");}
	}
};


%nodefaultctor Handle_Interface_CheckFailure;
class Handle_Interface_CheckFailure : public Handle_Interface_InterfaceError {
	public:
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure();
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure(const Handle_Interface_CheckFailure &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure(const Interface_CheckFailure *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure & operator=(const Handle_Interface_CheckFailure &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure & operator=(const Interface_CheckFailure *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_CheckFailure {
	Interface_CheckFailure* GetObject() {
	return (Interface_CheckFailure*)$self->Access();
	}
};
%extend Handle_Interface_CheckFailure {
	~Handle_Interface_CheckFailure() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_CheckFailure\n");}
	}
};


%nodefaultctor Handle_Interface_Check;
class Handle_Interface_Check : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_Check();
		%feature("autodoc", "1");
		Handle_Interface_Check(const Handle_Interface_Check &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Check(const Interface_Check *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Check & operator=(const Handle_Interface_Check &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Check & operator=(const Interface_Check *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Check const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Check {
	Interface_Check* GetObject() {
	return (Interface_Check*)$self->Access();
	}
};
%extend Handle_Interface_Check {
	~Handle_Interface_Check() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_Check\n");}
	}
};


%nodefaultctor Handle_Interface_SignType;
class Handle_Interface_SignType : public Handle_MoniTool_SignText {
	public:
		%feature("autodoc", "1");
		Handle_Interface_SignType();
		%feature("autodoc", "1");
		Handle_Interface_SignType(const Handle_Interface_SignType &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SignType(const Interface_SignType *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SignType & operator=(const Handle_Interface_SignType &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SignType & operator=(const Interface_SignType *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SignType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SignType {
	Interface_SignType* GetObject() {
	return (Interface_SignType*)$self->Access();
	}
};
%extend Handle_Interface_SignType {
	~Handle_Interface_SignType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_SignType\n");}
	}
};


%nodefaultctor Handle_Interface_CopyControl;
class Handle_Interface_CopyControl : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_CopyControl();
		%feature("autodoc", "1");
		Handle_Interface_CopyControl(const Handle_Interface_CopyControl &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CopyControl(const Interface_CopyControl *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CopyControl & operator=(const Handle_Interface_CopyControl &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CopyControl & operator=(const Interface_CopyControl *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CopyControl const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_CopyControl {
	Interface_CopyControl* GetObject() {
	return (Interface_CopyControl*)$self->Access();
	}
};
%extend Handle_Interface_CopyControl {
	~Handle_Interface_CopyControl() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_CopyControl\n");}
	}
};


%nodefaultctor Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
class Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString();
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString(const Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString(const Interface_IndexedMapNodeOfIndexedMapOfAsciiString *anItem);
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString & operator=(const Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString & operator=(const Interface_IndexedMapNodeOfIndexedMapOfAsciiString *anItem);
		%feature("autodoc", "1");
		Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	Interface_IndexedMapNodeOfIndexedMapOfAsciiString* GetObject() {
	return (Interface_IndexedMapNodeOfIndexedMapOfAsciiString*)$self->Access();
	}
};
%extend Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	~Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString\n");}
	}
};


%nodefaultctor Handle_Interface_NodeOfReaderLib;
class Handle_Interface_NodeOfReaderLib : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib();
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib(const Handle_Interface_NodeOfReaderLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib(const Interface_NodeOfReaderLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib & operator=(const Handle_Interface_NodeOfReaderLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib & operator=(const Interface_NodeOfReaderLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfReaderLib const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_NodeOfReaderLib {
	Interface_NodeOfReaderLib* GetObject() {
	return (Interface_NodeOfReaderLib*)$self->Access();
	}
};
%extend Handle_Interface_NodeOfReaderLib {
	~Handle_Interface_NodeOfReaderLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_NodeOfReaderLib\n");}
	}
};


%nodefaultctor Handle_Interface_TypedValue;
class Handle_Interface_TypedValue : public Handle_MoniTool_TypedValue {
	public:
		%feature("autodoc", "1");
		Handle_Interface_TypedValue();
		%feature("autodoc", "1");
		Handle_Interface_TypedValue(const Handle_Interface_TypedValue &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_TypedValue(const Interface_TypedValue *anItem);
		%feature("autodoc", "1");
		Handle_Interface_TypedValue & operator=(const Handle_Interface_TypedValue &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_TypedValue & operator=(const Interface_TypedValue *anItem);
		%feature("autodoc", "1");
		Handle_Interface_TypedValue const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_TypedValue {
	Interface_TypedValue* GetObject() {
	return (Interface_TypedValue*)$self->Access();
	}
};
%extend Handle_Interface_TypedValue {
	~Handle_Interface_TypedValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_TypedValue\n");}
	}
};


%nodefaultctor Handle_Interface_CopyMap;
class Handle_Interface_CopyMap : public Handle_Interface_CopyControl {
	public:
		%feature("autodoc", "1");
		Handle_Interface_CopyMap();
		%feature("autodoc", "1");
		Handle_Interface_CopyMap(const Handle_Interface_CopyMap &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CopyMap(const Interface_CopyMap *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CopyMap & operator=(const Handle_Interface_CopyMap &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_CopyMap & operator=(const Interface_CopyMap *anItem);
		%feature("autodoc", "1");
		Handle_Interface_CopyMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_CopyMap {
	Interface_CopyMap* GetObject() {
	return (Interface_CopyMap*)$self->Access();
	}
};
%extend Handle_Interface_CopyMap {
	~Handle_Interface_CopyMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_CopyMap\n");}
	}
};


%nodefaultctor Handle_Interface_GeneralModule;
class Handle_Interface_GeneralModule : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule();
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule(const Handle_Interface_GeneralModule &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule(const Interface_GeneralModule *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule & operator=(const Handle_Interface_GeneralModule &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule & operator=(const Interface_GeneralModule *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GeneralModule const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GeneralModule {
	Interface_GeneralModule* GetObject() {
	return (Interface_GeneralModule*)$self->Access();
	}
};
%extend Handle_Interface_GeneralModule {
	~Handle_Interface_GeneralModule() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_GeneralModule\n");}
	}
};


%nodefaultctor Handle_Interface_ReaderModule;
class Handle_Interface_ReaderModule : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule();
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule(const Handle_Interface_ReaderModule &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule(const Interface_ReaderModule *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule & operator=(const Handle_Interface_ReaderModule &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule & operator=(const Interface_ReaderModule *anItem);
		%feature("autodoc", "1");
		Handle_Interface_ReaderModule const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_ReaderModule {
	Interface_ReaderModule* GetObject() {
	return (Interface_ReaderModule*)$self->Access();
	}
};
%extend Handle_Interface_ReaderModule {
	~Handle_Interface_ReaderModule() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_ReaderModule\n");}
	}
};


%nodefaultctor Handle_Interface_GTool;
class Handle_Interface_GTool : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_GTool();
		%feature("autodoc", "1");
		Handle_Interface_GTool(const Handle_Interface_GTool &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GTool(const Interface_GTool *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GTool & operator=(const Handle_Interface_GTool &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GTool & operator=(const Interface_GTool *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GTool const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GTool {
	Interface_GTool* GetObject() {
	return (Interface_GTool*)$self->Access();
	}
};
%extend Handle_Interface_GTool {
	~Handle_Interface_GTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_GTool\n");}
	}
};


%nodefaultctor Handle_Interface_InterfaceMismatch;
class Handle_Interface_InterfaceMismatch : public Handle_Interface_InterfaceError {
	public:
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch();
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch(const Handle_Interface_InterfaceMismatch &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch(const Interface_InterfaceMismatch *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch & operator=(const Handle_Interface_InterfaceMismatch &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch & operator=(const Interface_InterfaceMismatch *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_InterfaceMismatch {
	Interface_InterfaceMismatch* GetObject() {
	return (Interface_InterfaceMismatch*)$self->Access();
	}
};
%extend Handle_Interface_InterfaceMismatch {
	~Handle_Interface_InterfaceMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_InterfaceMismatch\n");}
	}
};


%nodefaultctor Handle_Interface_InterfaceModel;
class Handle_Interface_InterfaceModel : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel();
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel(const Handle_Interface_InterfaceModel &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel(const Interface_InterfaceModel *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel & operator=(const Handle_Interface_InterfaceModel &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel & operator=(const Interface_InterfaceModel *anItem);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_InterfaceModel {
	Interface_InterfaceModel* GetObject() {
	return (Interface_InterfaceModel*)$self->Access();
	}
};
%extend Handle_Interface_InterfaceModel {
	~Handle_Interface_InterfaceModel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_InterfaceModel\n");}
	}
};


%nodefaultctor Handle_Interface_SequenceNodeOfSequenceOfCheck;
class Handle_Interface_SequenceNodeOfSequenceOfCheck : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck();
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck(const Handle_Interface_SequenceNodeOfSequenceOfCheck &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck(const Interface_SequenceNodeOfSequenceOfCheck *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck & operator=(const Handle_Interface_SequenceNodeOfSequenceOfCheck &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck & operator=(const Interface_SequenceNodeOfSequenceOfCheck *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SequenceNodeOfSequenceOfCheck const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SequenceNodeOfSequenceOfCheck {
	Interface_SequenceNodeOfSequenceOfCheck* GetObject() {
	return (Interface_SequenceNodeOfSequenceOfCheck*)$self->Access();
	}
};
%extend Handle_Interface_SequenceNodeOfSequenceOfCheck {
	~Handle_Interface_SequenceNodeOfSequenceOfCheck() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_SequenceNodeOfSequenceOfCheck\n");}
	}
};


%nodefaultctor Handle_Interface_HSequenceOfCheck;
class Handle_Interface_HSequenceOfCheck : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck();
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck(const Handle_Interface_HSequenceOfCheck &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck(const Interface_HSequenceOfCheck *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck & operator=(const Handle_Interface_HSequenceOfCheck &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck & operator=(const Interface_HSequenceOfCheck *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HSequenceOfCheck {
	Interface_HSequenceOfCheck* GetObject() {
	return (Interface_HSequenceOfCheck*)$self->Access();
	}
};
%extend Handle_Interface_HSequenceOfCheck {
	~Handle_Interface_HSequenceOfCheck() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_HSequenceOfCheck\n");}
	}
};


%nodefaultctor Handle_Interface_NodeOfGeneralLib;
class Handle_Interface_NodeOfGeneralLib : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib();
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib(const Handle_Interface_NodeOfGeneralLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib(const Interface_NodeOfGeneralLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib & operator=(const Handle_Interface_NodeOfGeneralLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib & operator=(const Interface_NodeOfGeneralLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_NodeOfGeneralLib const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_NodeOfGeneralLib {
	Interface_NodeOfGeneralLib* GetObject() {
	return (Interface_NodeOfGeneralLib*)$self->Access();
	}
};
%extend Handle_Interface_NodeOfGeneralLib {
	~Handle_Interface_NodeOfGeneralLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_NodeOfGeneralLib\n");}
	}
};


%nodefaultctor Handle_Interface_FileReaderData;
class Handle_Interface_FileReaderData : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData();
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData(const Handle_Interface_FileReaderData &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData(const Interface_FileReaderData *anItem);
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData & operator=(const Handle_Interface_FileReaderData &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData & operator=(const Interface_FileReaderData *anItem);
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_FileReaderData {
	Interface_FileReaderData* GetObject() {
	return (Interface_FileReaderData*)$self->Access();
	}
};
%extend Handle_Interface_FileReaderData {
	~Handle_Interface_FileReaderData() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_FileReaderData\n");}
	}
};


%nodefaultctor Handle_Interface_IntVal;
class Handle_Interface_IntVal : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_IntVal();
		%feature("autodoc", "1");
		Handle_Interface_IntVal(const Handle_Interface_IntVal &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_IntVal(const Interface_IntVal *anItem);
		%feature("autodoc", "1");
		Handle_Interface_IntVal & operator=(const Handle_Interface_IntVal &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_IntVal & operator=(const Interface_IntVal *anItem);
		%feature("autodoc", "1");
		Handle_Interface_IntVal const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_IntVal {
	Interface_IntVal* GetObject() {
	return (Interface_IntVal*)$self->Access();
	}
};
%extend Handle_Interface_IntVal {
	~Handle_Interface_IntVal() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_IntVal\n");}
	}
};


%nodefaultctor Handle_Interface_HArray1OfHAsciiString;
class Handle_Interface_HArray1OfHAsciiString : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString();
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString(const Handle_Interface_HArray1OfHAsciiString &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString(const Interface_HArray1OfHAsciiString *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString & operator=(const Handle_Interface_HArray1OfHAsciiString &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString & operator=(const Interface_HArray1OfHAsciiString *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HArray1OfHAsciiString {
	Interface_HArray1OfHAsciiString* GetObject() {
	return (Interface_HArray1OfHAsciiString*)$self->Access();
	}
};
%extend Handle_Interface_HArray1OfHAsciiString {
	~Handle_Interface_HArray1OfHAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_HArray1OfHAsciiString\n");}
	}
};


%nodefaultctor Handle_Interface_Static;
class Handle_Interface_Static : public Handle_Interface_TypedValue {
	public:
		%feature("autodoc", "1");
		Handle_Interface_Static();
		%feature("autodoc", "1");
		Handle_Interface_Static(const Handle_Interface_Static &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Static(const Interface_Static *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Static & operator=(const Handle_Interface_Static &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Static & operator=(const Interface_Static *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Static const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Static {
	Interface_Static* GetObject() {
	return (Interface_Static*)$self->Access();
	}
};
%extend Handle_Interface_Static {
	~Handle_Interface_Static() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_Static\n");}
	}
};


%nodefaultctor Handle_Interface_GlobalNodeOfGeneralLib;
class Handle_Interface_GlobalNodeOfGeneralLib : public Handle_Standard_Transient {
	public:
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib();
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib(const Handle_Interface_GlobalNodeOfGeneralLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib(const Interface_GlobalNodeOfGeneralLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib & operator=(const Handle_Interface_GlobalNodeOfGeneralLib &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib & operator=(const Interface_GlobalNodeOfGeneralLib *anItem);
		%feature("autodoc", "1");
		Handle_Interface_GlobalNodeOfGeneralLib const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_GlobalNodeOfGeneralLib {
	Interface_GlobalNodeOfGeneralLib* GetObject() {
	return (Interface_GlobalNodeOfGeneralLib*)$self->Access();
	}
};
%extend Handle_Interface_GlobalNodeOfGeneralLib {
	~Handle_Interface_GlobalNodeOfGeneralLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_GlobalNodeOfGeneralLib\n");}
	}
};


%nodefaultctor Handle_Interface_SignLabel;
class Handle_Interface_SignLabel : public Handle_MoniTool_SignText {
	public:
		%feature("autodoc", "1");
		Handle_Interface_SignLabel();
		%feature("autodoc", "1");
		Handle_Interface_SignLabel(const Handle_Interface_SignLabel &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SignLabel(const Interface_SignLabel *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SignLabel & operator=(const Handle_Interface_SignLabel &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_SignLabel & operator=(const Interface_SignLabel *anItem);
		%feature("autodoc", "1");
		Handle_Interface_SignLabel const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_SignLabel {
	Interface_SignLabel* GetObject() {
	return (Interface_SignLabel*)$self->Access();
	}
};
%extend Handle_Interface_SignLabel {
	~Handle_Interface_SignLabel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_SignLabel\n");}
	}
};


%nodefaultctor Handle_Interface_UndefinedContent;
class Handle_Interface_UndefinedContent : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent();
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent(const Handle_Interface_UndefinedContent &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent(const Interface_UndefinedContent *anItem);
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent & operator=(const Handle_Interface_UndefinedContent &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent & operator=(const Interface_UndefinedContent *anItem);
		%feature("autodoc", "1");
		Handle_Interface_UndefinedContent const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_UndefinedContent {
	Interface_UndefinedContent* GetObject() {
	return (Interface_UndefinedContent*)$self->Access();
	}
};
%extend Handle_Interface_UndefinedContent {
	~Handle_Interface_UndefinedContent() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_UndefinedContent\n");}
	}
};


%nodefaultctor Handle_Interface_Protocol;
class Handle_Interface_Protocol : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_Protocol();
		%feature("autodoc", "1");
		Handle_Interface_Protocol(const Handle_Interface_Protocol &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Protocol(const Interface_Protocol *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Protocol & operator=(const Handle_Interface_Protocol &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_Protocol & operator=(const Interface_Protocol *anItem);
		%feature("autodoc", "1");
		Handle_Interface_Protocol const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_Protocol {
	Interface_Protocol* GetObject() {
	return (Interface_Protocol*)$self->Access();
	}
};
%extend Handle_Interface_Protocol {
	~Handle_Interface_Protocol() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_Protocol\n");}
	}
};


%nodefaultctor Handle_Interface_HGraph;
class Handle_Interface_HGraph : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_HGraph();
		%feature("autodoc", "1");
		Handle_Interface_HGraph(const Handle_Interface_HGraph &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HGraph(const Interface_HGraph *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HGraph & operator=(const Handle_Interface_HGraph &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_HGraph & operator=(const Interface_HGraph *anItem);
		%feature("autodoc", "1");
		Handle_Interface_HGraph const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_HGraph {
	Interface_HGraph* GetObject() {
	return (Interface_HGraph*)$self->Access();
	}
};
%extend Handle_Interface_HGraph {
	~Handle_Interface_HGraph() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_HGraph\n");}
	}
};


%nodefaultctor Handle_Interface_DataMapNodeOfDataMapOfTransientInteger;
class Handle_Interface_DataMapNodeOfDataMapOfTransientInteger : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger();
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger(const Handle_Interface_DataMapNodeOfDataMapOfTransientInteger &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger(const Interface_DataMapNodeOfDataMapOfTransientInteger *anItem);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger & operator=(const Handle_Interface_DataMapNodeOfDataMapOfTransientInteger &aHandle);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger & operator=(const Interface_DataMapNodeOfDataMapOfTransientInteger *anItem);
		%feature("autodoc", "1");
		Handle_Interface_DataMapNodeOfDataMapOfTransientInteger const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger {
	Interface_DataMapNodeOfDataMapOfTransientInteger* GetObject() {
	return (Interface_DataMapNodeOfDataMapOfTransientInteger*)$self->Access();
	}
};
%extend Handle_Interface_DataMapNodeOfDataMapOfTransientInteger {
	~Handle_Interface_DataMapNodeOfDataMapOfTransientInteger() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Interface_DataMapNodeOfDataMapOfTransientInteger\n");}
	}
};


%nodefaultctor Interface_GlobalNodeOfReaderLib;
class Interface_GlobalNodeOfReaderLib : public Standard_Transient {
	public:
		%feature("autodoc", "1");
		Interface_GlobalNodeOfReaderLib();
		%feature("autodoc", "1");
		void Add(const Handle_Interface_ReaderModule &amodule, const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		const Handle_Interface_ReaderModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;
		%feature("autodoc", "1");
		const Handle_Interface_GlobalNodeOfReaderLib & Next() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_GlobalNodeOfReaderLib {
	Handle_Interface_GlobalNodeOfReaderLib GetHandle() {
	return *(Handle_Interface_GlobalNodeOfReaderLib*) &$self;
	}
};
%extend Interface_GlobalNodeOfReaderLib {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_GlobalNodeOfReaderLib {
	~Interface_GlobalNodeOfReaderLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GlobalNodeOfReaderLib\n");}
	}
};


%nodefaultctor Interface_GeneralModule;
class Interface_GeneralModule : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void FillShared(const Handle_Interface_InterfaceModel &model, const Standard_Integer CN, const Handle_Standard_Transient &ent, Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		virtual		void FillSharedCase(const Standard_Integer CN, const Handle_Standard_Transient &ent, Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		void Share(Interface_EntityIterator & iter, const Handle_Standard_Transient &shared) const;
		%feature("autodoc", "1");
		virtual		void ListImplied(const Handle_Interface_InterfaceModel &model, const Standard_Integer CN, const Handle_Standard_Transient &ent, Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		virtual		void ListImpliedCase(const Standard_Integer CN, const Handle_Standard_Transient &ent, Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		virtual		void CheckCase(const Standard_Integer CN, const Handle_Standard_Transient &ent, const Interface_ShareTool &shares, Handle_Interface_Check & ach) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean CanCopy(const Standard_Integer CN, const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Dispatch(const Standard_Integer CN, const Handle_Standard_Transient &entfrom, Handle_Standard_Transient & entto, Interface_CopyTool & TC) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewVoid(const Standard_Integer CN, Handle_Standard_Transient & entto) const;
		%feature("autodoc", "1");
		virtual		void CopyCase(const Standard_Integer CN, const Handle_Standard_Transient &entfrom, const Handle_Standard_Transient &entto, Interface_CopyTool & TC) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewCopiedCase(const Standard_Integer CN, const Handle_Standard_Transient &entfrom, Handle_Standard_Transient & entto, Interface_CopyTool & TC) const;
		%feature("autodoc", "1");
		virtual		void RenewImpliedCase(const Standard_Integer CN, const Handle_Standard_Transient &entfrom, const Handle_Standard_Transient &entto, const Interface_CopyTool &TC) const;
		%feature("autodoc", "1");
		virtual		void WhenDeleteCase(const Standard_Integer CN, const Handle_Standard_Transient &ent, const Standard_Boolean dispatched) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer CategoryNumber(const Standard_Integer CN, const Handle_Standard_Transient &ent, const Interface_ShareTool &shares) const;
		%feature("autodoc", "1");
		virtual		Handle_TCollection_HAsciiString Name(const Standard_Integer CN, const Handle_Standard_Transient &ent, const Interface_ShareTool &shares) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_GeneralModule {
	Handle_Interface_GeneralModule GetHandle() {
	return *(Handle_Interface_GeneralModule*) &$self;
	}
};
%extend Interface_GeneralModule {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_GeneralModule {
	~Interface_GeneralModule() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GeneralModule\n");}
	}
};


%nodefaultctor Interface_DataMapIteratorOfDataMapOfTransientInteger;
class Interface_DataMapIteratorOfDataMapOfTransientInteger : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		Interface_DataMapIteratorOfDataMapOfTransientInteger();
		%feature("autodoc", "1");
		Interface_DataMapIteratorOfDataMapOfTransientInteger(const Interface_DataMapOfTransientInteger &aMap);
		%feature("autodoc", "1");
		void Initialize(const Interface_DataMapOfTransientInteger &aMap);
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Key() const;
		%feature("autodoc", "1");
		const Standard_Integer & Value() const;

};
%extend Interface_DataMapIteratorOfDataMapOfTransientInteger {
	~Interface_DataMapIteratorOfDataMapOfTransientInteger() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapIteratorOfDataMapOfTransientInteger\n");}
	}
};


%nodefaultctor Interface_FileReaderData;
class Interface_FileReaderData : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		Standard_Integer NbRecords() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer FindNextRecord(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void InitParams(const Standard_Integer num);
		%feature("autodoc", "1");
		void AddParam(const Standard_Integer num, const char * aval, const Interface_ParamType atype, const Standard_Integer nument=0);
		%feature("autodoc", "1");
		void AddParam(const Standard_Integer num, const TCollection_AsciiString &aval, const Interface_ParamType atype, const Standard_Integer nument=0);
		%feature("autodoc", "1");
		void AddParam(const Standard_Integer num, const Interface_FileParameter &FP);
		%feature("autodoc", "1");
		void SetParam(const Standard_Integer num, const Standard_Integer nump, const Interface_FileParameter &FP);
		%feature("autodoc", "1");
		Standard_Integer NbParams(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Handle_Interface_ParamList Params(const Standard_Integer num) const;
		%feature("autodoc", "1");
		const Interface_FileParameter & Param(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		Interface_FileParameter & ChangeParam(const Standard_Integer num, const Standard_Integer nump);
		%feature("autodoc", "1");
		Interface_ParamType ParamType(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		char * ParamCValue(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		Standard_Boolean IsParamDefined(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		Standard_Integer ParamNumber(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & ParamEntity(const Standard_Integer num, const Standard_Integer nump) const;
		%feature("autodoc", "1");
		Standard_Integer ParamFirstRank(const Standard_Integer num) const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & BoundEntity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void BindEntity(const Standard_Integer num, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void SetErrorLoad(const Standard_Boolean val);
		%feature("autodoc", "1");
		Standard_Boolean IsErrorLoad() const;
		%feature("autodoc", "1");
		Standard_Boolean ResetErrorLoad();
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Real Fastof(const char * str);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_FileReaderData {
	Handle_Interface_FileReaderData GetHandle() {
	return *(Handle_Interface_FileReaderData*) &$self;
	}
};
%extend Interface_FileReaderData {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_FileReaderData {
	~Interface_FileReaderData() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_FileReaderData\n");}
	}
};


%nodefaultctor Interface_MSG;
class Interface_MSG {
	public:
		%feature("autodoc", "1");
		Interface_MSG(const char * key);
		%feature("autodoc", "1");
		Interface_MSG(const char * key, const Standard_Integer i1);
		%feature("autodoc", "1");
		Interface_MSG(const char * key, const Standard_Integer i1, const Standard_Integer i2);
		%feature("autodoc", "1");
		Interface_MSG(const char * key, const Standard_Real r1, const Standard_Integer intervals=-0x000000001);
		%feature("autodoc", "1");
		Interface_MSG(const char * key, const char * str);
		%feature("autodoc", "1");
		Interface_MSG(const char * key, const Standard_Integer ival, const char * str);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_CString Value() const;
		%feature("autodoc", "1");
		%extend{
			void ReadFromString(std::string src) {
			std::stringstream s(src);
			self->Read(s);}
		};
		%feature("autodoc", "1");
		Standard_Integer Read(const char * file);
		%feature("autodoc", "1");
		Standard_Integer Write(Standard_OStream & S, const char * rootkey="");
		%feature("autodoc", "1");
		Standard_Boolean IsKey(const char * mess);
		%feature("autodoc", "1");
		char * Translated(const char * key);
		%feature("autodoc", "1");
		void Record(const char * key, const char * item);
		%feature("autodoc", "1");
		void SetTrace(const Standard_Boolean toprint, const Standard_Boolean torecord);
		%feature("autodoc", "1");
		void SetMode(const Standard_Boolean running, const Standard_Boolean raising);
		%feature("autodoc", "1");
		%extend{
			std::string PrintTraceToString() {
			std::stringstream s;
			self->PrintTrace(s);
			return s.str();}
		};
		%feature("autodoc", "1");
		Standard_Real Intervalled(const Standard_Real val, const Standard_Integer order=3, const Standard_Boolean upper=0);
		%feature("autodoc", "1");
		void TDate(const char * text, const Standard_Integer yy, const Standard_Integer mm, const Standard_Integer dd, const Standard_Integer hh, const Standard_Integer mn, const Standard_Integer ss, const char * format="");
		%feature("autodoc", "1");
		Standard_Boolean NDate(const char * text, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);
		%feature("autodoc", "1");
		Standard_Integer CDate(const char * text1, const char * text2);
		%feature("autodoc", "1");
		char * Blanks(const Standard_Integer val, const Standard_Integer max);
		%feature("autodoc", "1");
		char * Blanks(const char * val, const Standard_Integer max);
		%feature("autodoc", "1");
		char * Blanks(const Standard_Integer count);
		%feature("autodoc", "1");
		void Print(Standard_OStream & S, const char * val, const Standard_Integer max, const Standard_Integer just=-0x000000001);

};
%extend Interface_MSG {
	~Interface_MSG() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_MSG\n");}
	}
};


%nodefaultctor Interface_DataMapIteratorOfDataMapOfIntegerTransient;
class Interface_DataMapIteratorOfDataMapOfIntegerTransient : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		Interface_DataMapIteratorOfDataMapOfIntegerTransient();
		%feature("autodoc", "1");
		Interface_DataMapIteratorOfDataMapOfIntegerTransient(const Interface_DataMapOfIntegerTransient &aMap);
		%feature("autodoc", "1");
		void Initialize(const Interface_DataMapOfIntegerTransient &aMap);
		%feature("autodoc", "1");
		const Standard_Integer & Key() const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Value() const;

};
%extend Interface_DataMapIteratorOfDataMapOfIntegerTransient {
	~Interface_DataMapIteratorOfDataMapOfIntegerTransient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapIteratorOfDataMapOfIntegerTransient\n");}
	}
};


%nodefaultctor Interface_GlobalNodeOfGeneralLib;
class Interface_GlobalNodeOfGeneralLib : public Standard_Transient {
	public:
		%feature("autodoc", "1");
		Interface_GlobalNodeOfGeneralLib();
		%feature("autodoc", "1");
		void Add(const Handle_Interface_GeneralModule &amodule, const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		const Handle_Interface_GeneralModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;
		%feature("autodoc", "1");
		const Handle_Interface_GlobalNodeOfGeneralLib & Next() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_GlobalNodeOfGeneralLib {
	Handle_Interface_GlobalNodeOfGeneralLib GetHandle() {
	return *(Handle_Interface_GlobalNodeOfGeneralLib*) &$self;
	}
};
%extend Interface_GlobalNodeOfGeneralLib {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_GlobalNodeOfGeneralLib {
	~Interface_GlobalNodeOfGeneralLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GlobalNodeOfGeneralLib\n");}
	}
};


%nodefaultctor Interface_Array1OfFileParameter;
class Interface_Array1OfFileParameter {
	public:
		%feature("autodoc", "1");
		Interface_Array1OfFileParameter(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		Interface_Array1OfFileParameter(const Interface_FileParameter &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Interface_FileParameter &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const Interface_Array1OfFileParameter & Assign(const Interface_Array1OfFileParameter &Other);
		%feature("autodoc", "1");
		const Interface_Array1OfFileParameter & operator=(const Interface_Array1OfFileParameter &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Interface_FileParameter &Value);
		%feature("autodoc", "1");
		const Interface_FileParameter & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Interface_FileParameter & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Interface_FileParameter & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Interface_FileParameter & operator()(const Standard_Integer Index);

};
%extend Interface_Array1OfFileParameter {
	~Interface_Array1OfFileParameter() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Array1OfFileParameter\n");}
	}
};


%nodefaultctor Interface_ShareFlags;
class Interface_ShareFlags {
	public:
		%feature("autodoc", "1");
		Interface_ShareFlags(const Handle_Interface_InterfaceModel &amodel, const Interface_GeneralLib &lib);
		%feature("autodoc", "1");
		Interface_ShareFlags(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Interface_ShareFlags(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_ShareFlags(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Interface_ShareFlags(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		Standard_Boolean IsShared(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_EntityIterator RootEntities() const;
		%feature("autodoc", "1");
		Standard_Integer NbRoots() const;
		%feature("autodoc", "1");
		Handle_Standard_Transient Root(const Standard_Integer num=1) const;

};
%extend Interface_ShareFlags {
	~Interface_ShareFlags() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ShareFlags\n");}
	}
};


%nodefaultctor Interface_CopyControl;
class Interface_CopyControl : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void Clear();
		%feature("autodoc", "1");
		virtual		void Bind(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &res);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Search(const Handle_Standard_Transient &ent, Handle_Standard_Transient & res) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_CopyControl {
	Handle_Interface_CopyControl GetHandle() {
	return *(Handle_Interface_CopyControl*) &$self;
	}
};
%extend Interface_CopyControl {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_CopyControl {
	~Interface_CopyControl() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CopyControl\n");}
	}
};


%nodefaultctor Interface_ReaderLib;
class Interface_ReaderLib {
	public:
		%feature("autodoc", "1");
		void SetGlobal(const Handle_Interface_ReaderModule &amodule, const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		Interface_ReaderLib(const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		Interface_ReaderLib();
		%feature("autodoc", "1");
		void AddProtocol(const Handle_Standard_Transient &aprotocol);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void SetComplete();
		%feature("autodoc", "1");
		Standard_Boolean Select(const Handle_Standard_Transient &obj, Handle_Interface_ReaderModule & module, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		void Start();
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		const Handle_Interface_ReaderModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;

};
%extend Interface_ReaderLib {
	~Interface_ReaderLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ReaderLib\n");}
	}
};


%nodefaultctor Interface_ReaderModule;
class Interface_ReaderModule : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Interface_FileReaderData &data, const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		void Read(const Standard_Integer casenum, const Handle_Interface_FileReaderData &data, const Standard_Integer num, Handle_Interface_Check & ach, const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean NewRead(const Standard_Integer casenum, const Handle_Interface_FileReaderData &data, const Standard_Integer num, Handle_Interface_Check & ach, Handle_Standard_Transient & ent) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_ReaderModule {
	Handle_Interface_ReaderModule GetHandle() {
	return *(Handle_Interface_ReaderModule*) &$self;
	}
};
%extend Interface_ReaderModule {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_ReaderModule {
	~Interface_ReaderModule() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ReaderModule\n");}
	}
};


%nodefaultctor Interface_DataMapNodeOfDataMapOfTransientInteger;
class Interface_DataMapNodeOfDataMapOfTransientInteger : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Interface_DataMapNodeOfDataMapOfTransientInteger(const Handle_Standard_Transient &K, const Standard_Integer &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_Standard_Transient & Key() const;
		%feature("autodoc", "1");
		Standard_Integer & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	Handle_Interface_DataMapNodeOfDataMapOfTransientInteger GetHandle() {
	return *(Handle_Interface_DataMapNodeOfDataMapOfTransientInteger*) &$self;
	}
};
%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_DataMapNodeOfDataMapOfTransientInteger {
	~Interface_DataMapNodeOfDataMapOfTransientInteger() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapNodeOfDataMapOfTransientInteger\n");}
	}
};


%nodefaultctor Interface_EntityList;
class Interface_EntityList {
	public:
		%feature("autodoc", "1");
		Interface_EntityList();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void Add(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void Remove(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Value(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer num, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void FillIterator(Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		Standard_Integer NbTypedEntities(const Handle_Standard_Type &atype) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient TypedEntity(const Handle_Standard_Type &atype, const Standard_Integer num=0) const;

};
%extend Interface_EntityList {
	~Interface_EntityList() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_EntityList\n");}
	}
};


%nodefaultctor Interface_IndexedMapNodeOfIndexedMapOfAsciiString;
class Interface_IndexedMapNodeOfIndexedMapOfAsciiString : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Interface_IndexedMapNodeOfIndexedMapOfAsciiString(const TCollection_AsciiString &K1, const Standard_Integer K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		TCollection_AsciiString & Key1() const;
		%feature("autodoc", "1");
		Standard_Integer & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString GetHandle() {
	return *(Handle_Interface_IndexedMapNodeOfIndexedMapOfAsciiString*) &$self;
	}
};
%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_IndexedMapNodeOfIndexedMapOfAsciiString {
	~Interface_IndexedMapNodeOfIndexedMapOfAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_IndexedMapNodeOfIndexedMapOfAsciiString\n");}
	}
};


%nodefaultctor Interface_CopyMap;
class Interface_CopyMap : public Interface_CopyControl {
	public:
		%feature("autodoc", "1");
		Interface_CopyMap(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		virtual		void Clear();
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		virtual		void Bind(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &res);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Search(const Handle_Standard_Transient &ent, Handle_Standard_Transient & res) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_CopyMap {
	Handle_Interface_CopyMap GetHandle() {
	return *(Handle_Interface_CopyMap*) &$self;
	}
};
%extend Interface_CopyMap {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_CopyMap {
	~Interface_CopyMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CopyMap\n");}
	}
};


%nodefaultctor Interface_CopyTool;
class Interface_CopyTool {
	public:
		%feature("autodoc", "1");
		Interface_CopyTool(const Handle_Interface_InterfaceModel &amodel, const Interface_GeneralLib &lib);
		%feature("autodoc", "1");
		Interface_CopyTool(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_CopyTool(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		void SetControl(const Handle_Interface_CopyControl &othermap);
		%feature("autodoc", "1");
		Handle_Interface_CopyControl Control() const;
		%feature("autodoc", "1");
		virtual		void Clear();
		%feature("autodoc", "1");
		virtual		Standard_Boolean Copy(const Handle_Standard_Transient &entfrom, Handle_Standard_Transient & entto, const Standard_Boolean mapped, const Standard_Boolean errstat);
		%feature("autodoc", "1");
		Handle_Standard_Transient Transferred(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void Bind(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &res);
		%feature("autodoc", "1");
		Standard_Boolean Search(const Handle_Standard_Transient &ent, Handle_Standard_Transient & res) const;
		%feature("autodoc", "1");
		void ClearLastFlags();
		%feature("autodoc", "1");
		Standard_Integer LastCopiedAfter(const Standard_Integer numfrom, Handle_Standard_Transient & ent, Handle_Standard_Transient & res) const;
		%feature("autodoc", "1");
		void TransferEntity(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void RenewImpliedRefs();
		%feature("autodoc", "1");
		void FillModel(const Handle_Interface_InterfaceModel &bmodel);
		%feature("autodoc", "1");
		Interface_EntityIterator CompleteResult(const Standard_Boolean withreports=0) const;
		%feature("autodoc", "1");
		Interface_EntityIterator RootResult(const Standard_Boolean withreports=0) const;
		%feature("autodoc", "1");
		virtual		void Destroy();

};
%extend Interface_CopyTool {
	~Interface_CopyTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CopyTool\n");}
	}
};


%nodefaultctor Interface_DataMapOfIntegerTransient;
class Interface_DataMapOfIntegerTransient : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Interface_DataMapOfIntegerTransient(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Interface_DataMapOfIntegerTransient & Assign(const Interface_DataMapOfIntegerTransient &Other);
		%feature("autodoc", "1");
		Interface_DataMapOfIntegerTransient & operator=(const Interface_DataMapOfIntegerTransient &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const Standard_Integer &K, const Handle_Standard_Transient &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const Standard_Integer &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const Standard_Integer &K);
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Find(const Standard_Integer &K) const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & operator()(const Standard_Integer &K) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient & ChangeFind(const Standard_Integer &K);
		%feature("autodoc", "1");
		Handle_Standard_Transient & operator()(const Standard_Integer &K);

};
%extend Interface_DataMapOfIntegerTransient {
	~Interface_DataMapOfIntegerTransient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapOfIntegerTransient\n");}
	}
};


%nodefaultctor Interface_GeneralLib;
class Interface_GeneralLib {
	public:
		%feature("autodoc", "1");
		void SetGlobal(const Handle_Interface_GeneralModule &amodule, const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		Interface_GeneralLib(const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		Interface_GeneralLib();
		%feature("autodoc", "1");
		void AddProtocol(const Handle_Standard_Transient &aprotocol);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void SetComplete();
		%feature("autodoc", "1");
		Standard_Boolean Select(const Handle_Standard_Transient &obj, Handle_Interface_GeneralModule & module, Standard_Integer &OutValue) const;
		%feature("autodoc", "1");
		void Start();
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		const Handle_Interface_GeneralModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;

};
%extend Interface_GeneralLib {
	~Interface_GeneralLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GeneralLib\n");}
	}
};


%nodefaultctor Interface_ParamList;
class Interface_ParamList : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_ParamList(const Standard_Integer theIncrement=256);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Interface_FileParameter &Value);
		%feature("autodoc", "1");
		const Interface_FileParameter & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Interface_FileParameter & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Interface_FileParameter & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Interface_FileParameter & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_ParamList {
	Handle_Interface_ParamList GetHandle() {
	return *(Handle_Interface_ParamList*) &$self;
	}
};
%extend Interface_ParamList {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_ParamList {
	~Interface_ParamList() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ParamList\n");}
	}
};


%nodefaultctor Interface_ShareTool;
class Interface_ShareTool {
	public:
		%feature("autodoc", "1");
		Interface_ShareTool(const Handle_Interface_InterfaceModel &amodel, const Interface_GeneralLib &lib);
		%feature("autodoc", "1");
		Interface_ShareTool(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Interface_ShareTool(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_ShareTool(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Interface_ShareTool(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		Interface_ShareTool(const Handle_Interface_HGraph &ahgraph);
		%feature("autodoc", "1");
		void AddImplied(const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		const Interface_Graph & Graph() const;
		%feature("autodoc", "1");
		Interface_EntityIterator RootEntities() const;
		%feature("autodoc", "1");
		Standard_Boolean IsShared(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Shareds(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Sharings(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Standard_Integer NbTypedSharings(const Handle_Standard_Transient &ent, const Handle_Standard_Type &atype) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient TypedSharing(const Handle_Standard_Transient &ent, const Handle_Standard_Type &atype) const;
		%feature("autodoc", "1");
		Interface_EntityIterator All(const Handle_Standard_Transient &ent, const Standard_Boolean rootlast=1) const;
		%feature("autodoc", "1");
		void Print(const Interface_EntityIterator &iter, const Handle_Message_Messenger &S) const;

};
%extend Interface_ShareTool {
	~Interface_ShareTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ShareTool\n");}
	}
};


%nodefaultctor Interface_HSequenceOfCheck;
class Interface_HSequenceOfCheck : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_HSequenceOfCheck();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Handle_Interface_Check &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_Interface_HSequenceOfCheck &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Handle_Interface_Check &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_Interface_HSequenceOfCheck &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Interface_Check &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_Interface_HSequenceOfCheck &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Interface_Check &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_Interface_HSequenceOfCheck &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Handle_Interface_Check &anItem);
		%feature("autodoc", "1");
		const Handle_Interface_Check & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Handle_Interface_Check & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const Interface_SequenceOfCheck & Sequence() const;
		%feature("autodoc", "1");
		Interface_SequenceOfCheck & ChangeSequence();
		%feature("autodoc", "1");
		Handle_Interface_HSequenceOfCheck ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_HSequenceOfCheck {
	Handle_Interface_HSequenceOfCheck GetHandle() {
	return *(Handle_Interface_HSequenceOfCheck*) &$self;
	}
};
%extend Interface_HSequenceOfCheck {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_HSequenceOfCheck {
	~Interface_HSequenceOfCheck() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_HSequenceOfCheck\n");}
	}
};


%nodefaultctor Interface_TypedValue;
class Interface_TypedValue : public MoniTool_TypedValue {
	public:
		%feature("autodoc", "1");
		Interface_TypedValue(const char * name, const Interface_ParamType type=Interface_ParamText, const char * init="");
		%feature("autodoc", "1");
		Interface_ParamType Type() const;
		%feature("autodoc", "1");
		MoniTool_ValueType ParamTypeToValueType(const Interface_ParamType typ);
		%feature("autodoc", "1");
		Interface_ParamType ValueTypeToParamType(const MoniTool_ValueType typ);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_TypedValue {
	Handle_Interface_TypedValue GetHandle() {
	return *(Handle_Interface_TypedValue*) &$self;
	}
};
%extend Interface_TypedValue {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_TypedValue {
	~Interface_TypedValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_TypedValue\n");}
	}
};


%nodefaultctor Interface_Static;
class Interface_Static : public Interface_TypedValue {
	public:
		%feature("autodoc", "1");
		Interface_Static(const char * family, const char * name, const Interface_ParamType type=Interface_ParamText, const char * init="");
		%feature("autodoc", "1");
		Interface_Static(const char * family, const char * name, const Handle_Interface_Static &other);
		%feature("autodoc", "1");
		void PrintStatic(const Handle_Message_Messenger &S) const;
		%feature("autodoc", "1");
		Standard_CString Family() const;
		%feature("autodoc", "1");
		void SetWild(const Handle_Interface_Static &wildcard);
		%feature("autodoc", "1");
		Handle_Interface_Static Wild() const;
		%feature("autodoc", "1");
		void SetUptodate();
		%feature("autodoc", "1");
		Standard_Boolean UpdatedStatus() const;
		%feature("autodoc", "1");
		Standard_Boolean Init(const char * family, const char * name, const Interface_ParamType type, const char * init="");
		%feature("autodoc", "1");
		Standard_Boolean Init(const char * family, const char * name, const Standard_Character type, const char * init="");
		%feature("autodoc", "1");
		Handle_Interface_Static Static(const char * name);
		%feature("autodoc", "1");
		Standard_Boolean IsPresent(const char * name);
		%feature("autodoc", "1");
		char * CDef(const char * name, const char * part);
		%feature("autodoc", "1");
		Standard_Integer IDef(const char * name, const char * part);
		%feature("autodoc", "1");
		Standard_Boolean IsSet(const char * name, const Standard_Boolean proper=1);
		%feature("autodoc", "1");
		char * CVal(const char * name);
		%feature("autodoc", "1");
		Standard_Integer IVal(const char * name);
		%feature("autodoc", "1");
		Standard_Real RVal(const char * name);
		%feature("autodoc", "1");
		Standard_Boolean SetCVal(const char * name, const char * val);
		%feature("autodoc", "1");
		Standard_Boolean SetIVal(const char * name, const Standard_Integer val);
		%feature("autodoc", "1");
		Standard_Boolean SetRVal(const char * name, const Standard_Real val);
		%feature("autodoc", "1");
		Standard_Boolean Update(const char * name);
		%feature("autodoc", "1");
		Standard_Boolean IsUpdated(const char * name);
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfHAsciiString Items(const Standard_Integer mode=0, const char * criter="");
		%feature("autodoc", "1");
		void Standards();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_Static {
	Handle_Interface_Static GetHandle() {
	return *(Handle_Interface_Static*) &$self;
	}
};
%extend Interface_Static {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_Static {
	~Interface_Static() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Static\n");}
	}
};


%nodefaultctor Interface_FloatWriter;
class Interface_FloatWriter {
	public:
		%feature("autodoc", "1");
		Interface_FloatWriter(const Standard_Integer chars=0);
		%feature("autodoc", "1");
		void SetFormat(const char * form, const Standard_Boolean reset=1);
		%feature("autodoc", "1");
		void SetFormatForRange(const char * form, const Standard_Real R1, const Standard_Real R2);
		%feature("autodoc", "1");
		void SetZeroSuppress(const Standard_Boolean mode);
		%feature("autodoc", "1");
		void SetDefaults(const Standard_Integer chars=0);
		%feature("autodoc", "1");
		void Options(Standard_Boolean & zerosup, Standard_Boolean & range, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		Standard_CString MainFormat() const;
		%feature("autodoc", "1");
		Standard_CString FormatForRange() const;
		%feature("autodoc", "1");
		Standard_Integer Write(const Standard_Real val, const char * text) const;
		%feature("autodoc", "1");
		Standard_Integer Convert(const Standard_Real val, const char * text, const Standard_Boolean zerosup, const Standard_Real Range1, const Standard_Real Range2, const char * mainform, const char * rangeform);

};
%extend Interface_FloatWriter {
	~Interface_FloatWriter() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_FloatWriter\n");}
	}
};


%nodefaultctor Interface_IntVal;
class Interface_IntVal : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_IntVal();
		%feature("autodoc", "1");
		Standard_Integer Value() const;
		%feature("autodoc", "1");
		Standard_Integer & CValue();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_IntVal {
	Handle_Interface_IntVal GetHandle() {
	return *(Handle_Interface_IntVal*) &$self;
	}
};
%extend Interface_IntVal {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_IntVal {
	~Interface_IntVal() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_IntVal\n");}
	}
};


%nodefaultctor Interface_NodeOfGeneralLib;
class Interface_NodeOfGeneralLib : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_NodeOfGeneralLib();
		%feature("autodoc", "1");
		void AddNode(const Handle_Interface_GlobalNodeOfGeneralLib &anode);
		%feature("autodoc", "1");
		const Handle_Interface_GeneralModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;
		%feature("autodoc", "1");
		const Handle_Interface_NodeOfGeneralLib & Next() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_NodeOfGeneralLib {
	Handle_Interface_NodeOfGeneralLib GetHandle() {
	return *(Handle_Interface_NodeOfGeneralLib*) &$self;
	}
};
%extend Interface_NodeOfGeneralLib {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_NodeOfGeneralLib {
	~Interface_NodeOfGeneralLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_NodeOfGeneralLib\n");}
	}
};


%nodefaultctor Interface_InterfaceError;
class Interface_InterfaceError : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Interface_InterfaceError();
		%feature("autodoc", "1");
		Interface_InterfaceError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_InterfaceError {
	Handle_Interface_InterfaceError GetHandle() {
	return *(Handle_Interface_InterfaceError*) &$self;
	}
};
%extend Interface_InterfaceError {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_InterfaceError {
	~Interface_InterfaceError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_InterfaceError\n");}
	}
};


%nodefaultctor Interface_UndefinedContent;
class Interface_UndefinedContent : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_UndefinedContent();
		%feature("autodoc", "1");
		Standard_Integer NbParams() const;
		%feature("autodoc", "1");
		Standard_Integer NbLiterals() const;
		%feature("autodoc", "1");
		Standard_Boolean ParamData(const Standard_Integer num, Interface_ParamType & ptype, Handle_Standard_Transient & ent, Handle_TCollection_HAsciiString & val) const;
		%feature("autodoc", "1");
		Interface_ParamType ParamType(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean IsParamEntity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient ParamEntity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString ParamValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void Reservate(const Standard_Integer nb, const Standard_Integer nblit);
		%feature("autodoc", "1");
		void AddLiteral(const Interface_ParamType ptype, const Handle_TCollection_HAsciiString &val);
		%feature("autodoc", "1");
		void AddEntity(const Interface_ParamType ptype, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void RemoveParam(const Standard_Integer num);
		%feature("autodoc", "1");
		void SetLiteral(const Standard_Integer num, const Interface_ParamType ptype, const Handle_TCollection_HAsciiString &val);
		%feature("autodoc", "1");
		void SetEntity(const Standard_Integer num, const Interface_ParamType ptype, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void SetEntity(const Standard_Integer num, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		Interface_EntityList EntityList() const;
		%feature("autodoc", "1");
		void GetFromAnother(const Handle_Interface_UndefinedContent &other, Interface_CopyTool & TC);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_UndefinedContent {
	Handle_Interface_UndefinedContent GetHandle() {
	return *(Handle_Interface_UndefinedContent*) &$self;
	}
};
%extend Interface_UndefinedContent {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_UndefinedContent {
	~Interface_UndefinedContent() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_UndefinedContent\n");}
	}
};


%nodefaultctor Interface_IntList;
class Interface_IntList {
	public:
		%feature("autodoc", "1");
		Interface_IntList();
		%feature("autodoc", "1");
		Interface_IntList(const Standard_Integer nbe);
		%feature("autodoc", "1");
		Interface_IntList(const Interface_IntList &other, const Standard_Boolean copied);
		%feature("autodoc", "1");
		void Initialize(const Standard_Integer nbe);
		%feature("autodoc", "1");
		void Internals(Standard_Integer &OutValue, Handle_TColStd_HArray1OfInteger & ents, Handle_TColStd_HArray1OfInteger & refs) const;
		%feature("autodoc", "1");
		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		void SetNbEntities(const Standard_Integer nbe);
		%feature("autodoc", "1");
		void SetNumber(const Standard_Integer number);
		%feature("autodoc", "1");
		Standard_Integer Number() const;
		%feature("autodoc", "1");
		Interface_IntList List(const Standard_Integer number, const Standard_Boolean copied=0) const;
		%feature("autodoc", "1");
		void SetRedefined(const Standard_Boolean mode);
		%feature("autodoc", "1");
		void Reservate(const Standard_Integer count);
		%feature("autodoc", "1");
		void Add(const Standard_Integer ref);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Boolean IsRedefined(const Standard_Integer num=0) const;
		%feature("autodoc", "1");
		Standard_Integer Value(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Standard_Integer num);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void AdjustSize(const Standard_Integer margin=0);

};
%extend Interface_IntList {
	~Interface_IntList() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_IntList\n");}
	}
};


%nodefaultctor Interface_SequenceNodeOfSequenceOfCheck;
class Interface_SequenceNodeOfSequenceOfCheck : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		Interface_SequenceNodeOfSequenceOfCheck(const Handle_Interface_Check &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_Interface_Check & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_SequenceNodeOfSequenceOfCheck {
	Handle_Interface_SequenceNodeOfSequenceOfCheck GetHandle() {
	return *(Handle_Interface_SequenceNodeOfSequenceOfCheck*) &$self;
	}
};
%extend Interface_SequenceNodeOfSequenceOfCheck {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_SequenceNodeOfSequenceOfCheck {
	~Interface_SequenceNodeOfSequenceOfCheck() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_SequenceNodeOfSequenceOfCheck\n");}
	}
};


%nodefaultctor Interface_BitMap;
class Interface_BitMap {
	public:
		%feature("autodoc", "1");
		Interface_BitMap(const Standard_Integer nbitems, const Standard_Integer resflags=0);
		%feature("autodoc", "1");
		Interface_BitMap(const Interface_BitMap &other, const Standard_Boolean copied=0);
		%feature("autodoc", "1");
		void Internals(Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue, Handle_TColStd_HArray1OfInteger & flags, Handle_TColStd_HSequenceOfAsciiString & names) const;
		%feature("autodoc", "1");
		void Reservate(const Standard_Integer moreflags);
		%feature("autodoc", "1");
		void SetLength(const Standard_Integer nbitems);
		%feature("autodoc", "1");
		Standard_Integer AddFlag(const char * name="");
		%feature("autodoc", "1");
		Standard_Integer AddSomeFlags(const Standard_Integer more);
		%feature("autodoc", "1");
		Standard_Boolean RemoveFlag(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Boolean SetFlagName(const Standard_Integer num, const char * name);
		%feature("autodoc", "1");
		Standard_Integer NbFlags() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		char * FlagName(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer FlagNumber(const char * name) const;
		%feature("autodoc", "1");
		Standard_Boolean Value(const Standard_Integer item, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer item, const Standard_Boolean val, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		void SetTrue(const Standard_Integer item, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		void SetFalse(const Standard_Integer item, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		Standard_Boolean CTrue(const Standard_Integer item, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		Standard_Boolean CFalse(const Standard_Integer item, const Standard_Integer flag=0) const;
		%feature("autodoc", "1");
		void Init(const Standard_Boolean val, const Standard_Integer flag=0) const;

};
%extend Interface_BitMap {
	~Interface_BitMap() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_BitMap\n");}
	}
};


%nodefaultctor Interface_FileReaderTool;
class Interface_FileReaderTool {
	public:
		%feature("autodoc", "1");
		void SetData(const Handle_Interface_FileReaderData &reader, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Handle_Interface_Protocol Protocol() const;
		%feature("autodoc", "1");
		Handle_Interface_FileReaderData Data() const;
		%feature("autodoc", "1");
		void SetModel(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		void SetMessenger(const Handle_Message_Messenger &messenger);
		%feature("autodoc", "1");
		Handle_Message_Messenger Messenger() const;
		%feature("autodoc", "1");
		void SetTraceLevel(const Standard_Integer tracelev);
		%feature("autodoc", "1");
		Standard_Integer TraceLevel() const;
		%feature("autodoc", "1");
		void SetErrorHandle(const Standard_Boolean err);
		%feature("autodoc", "1");
		Standard_Boolean ErrorHandle() const;
		%feature("autodoc", "1");
		void SetEntities();
		%feature("autodoc", "1");
		virtual		Standard_Boolean Recognize(const Standard_Integer num, Handle_Interface_Check & ach, Handle_Standard_Transient & ent);
		%feature("autodoc", "1");
		Standard_Boolean RecognizeByLib(const Standard_Integer num, Interface_GeneralLib & glib, Interface_ReaderLib & rlib, Handle_Interface_Check & ach, Handle_Standard_Transient & ent) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient UnknownEntity() const;
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel NewModel() const;
		%feature("autodoc", "1");
		void LoadModel(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Handle_Standard_Transient LoadedEntity(const Standard_Integer num);
		%feature("autodoc", "1");
		virtual		void BeginRead(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		virtual		Standard_Boolean AnalyseRecord(const Standard_Integer num, const Handle_Standard_Transient &anent, Handle_Interface_Check & acheck);
		%feature("autodoc", "1");
		virtual		void Destroy();
		%feature("autodoc", "1");
		virtual		void EndRead(const Handle_Interface_InterfaceModel &amodel);

};
%extend Interface_FileReaderTool {
	~Interface_FileReaderTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_FileReaderTool\n");}
	}
};


%nodefaultctor Interface_HArray1OfHAsciiString;
class Interface_HArray1OfHAsciiString : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_HArray1OfHAsciiString(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		Interface_HArray1OfHAsciiString(const Standard_Integer Low, const Standard_Integer Up, const Handle_TCollection_HAsciiString &V);
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TCollection_HAsciiString &Value);
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const Interface_Array1OfHAsciiString & Array1() const;
		%feature("autodoc", "1");
		Interface_Array1OfHAsciiString & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_HArray1OfHAsciiString {
	Handle_Interface_HArray1OfHAsciiString GetHandle() {
	return *(Handle_Interface_HArray1OfHAsciiString*) &$self;
	}
};
%extend Interface_HArray1OfHAsciiString {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_HArray1OfHAsciiString {
	~Interface_HArray1OfHAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_HArray1OfHAsciiString\n");}
	}
};


%nodefaultctor Interface_CheckTool;
class Interface_CheckTool {
	public:
		%feature("autodoc", "1");
		Interface_CheckTool(const Handle_Interface_InterfaceModel &model, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_CheckTool(const Handle_Interface_InterfaceModel &model);
		%feature("autodoc", "1");
		Interface_CheckTool(const Interface_Graph &graph);
		%feature("autodoc", "1");
		Interface_CheckTool(const Handle_Interface_HGraph &hgraph);
		%feature("autodoc", "1");
		void FillCheck(const Handle_Standard_Transient &ent, const Interface_ShareTool &sh, Handle_Interface_Check & ach);
		%feature("autodoc", "1");
		void Print(const Handle_Interface_Check &ach, const Handle_Message_Messenger &S) const;
		%feature("autodoc", "1");
		void Print(const Interface_CheckIterator &list, const Handle_Message_Messenger &S) const;
		%feature("autodoc", "1");
		Handle_Interface_Check Check(const Standard_Integer num);
		%feature("autodoc", "1");
		void CheckSuccess(const Standard_Boolean reset=0);
		%feature("autodoc", "1");
		Interface_CheckIterator CompleteCheckList();
		%feature("autodoc", "1");
		Interface_CheckIterator CheckList();
		%feature("autodoc", "1");
		Interface_CheckIterator AnalyseCheckList();
		%feature("autodoc", "1");
		Interface_CheckIterator VerifyCheckList();
		%feature("autodoc", "1");
		Interface_CheckIterator WarningCheckList();
		%feature("autodoc", "1");
		Interface_EntityIterator UnknownEntities();

};
%extend Interface_CheckTool {
	~Interface_CheckTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CheckTool\n");}
	}
};


%nodefaultctor Interface_Graph;
class Interface_Graph {
	public:
		%feature("autodoc", "1");
		Interface_Graph(const Handle_Interface_InterfaceModel &amodel, const Interface_GeneralLib &lib);
		%feature("autodoc", "1");
		Interface_Graph(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_Graph(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Interface_Graph(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		Interface_Graph(const Interface_Graph &agraph, const Standard_Boolean copied=0);
		%feature("autodoc", "1");
		void EvalSharings();
		%feature("autodoc", "1");
		void Reset();
		%feature("autodoc", "1");
		void ResetStatus();
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Integer EntityNumber(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Standard_Boolean IsPresent(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean IsPresent(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Entity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer & CStatus(const Standard_Integer num);
		%feature("autodoc", "1");
		void SetStatus(const Standard_Integer num, const Standard_Integer stat);
		%feature("autodoc", "1");
		void RemoveItem(const Standard_Integer num);
		%feature("autodoc", "1");
		void ChangeStatus(const Standard_Integer oldstat, const Standard_Integer newstat);
		%feature("autodoc", "1");
		void RemoveStatus(const Standard_Integer stat);
		%feature("autodoc", "1");
		const Interface_BitMap & BitMap() const;
		%feature("autodoc", "1");
		Interface_BitMap & CBitMap();
		%feature("autodoc", "1");
		const Handle_Interface_InterfaceModel & Model() const;
		%feature("autodoc", "1");
		void GetFromModel();
		%feature("autodoc", "1");
		void GetFromEntity(const Handle_Standard_Transient &ent, const Standard_Boolean shared, const Standard_Integer newstat=0);
		%feature("autodoc", "1");
		void GetFromEntity(const Handle_Standard_Transient &ent, const Standard_Boolean shared, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);
		%feature("autodoc", "1");
		void GetFromIter(const Interface_EntityIterator &iter, const Standard_Integer newstat);
		%feature("autodoc", "1");
		void GetFromIter(const Interface_EntityIterator &iter, const Standard_Integer newstat, const Standard_Integer overlapstat, const Standard_Boolean cumul);
		%feature("autodoc", "1");
		void GetFromGraph(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		void GetFromGraph(const Interface_Graph &agraph, const Standard_Integer stat);
		%feature("autodoc", "1");
		Standard_Boolean HasShareErrors(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Standard_Boolean HasRedefinedShareds(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Shareds(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_IntList SharedNums(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Sharings(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Interface_IntList SharingNums(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Interface_EntityIterator TypedSharings(const Handle_Standard_Transient &ent, const Handle_Standard_Type &type) const;
		%feature("autodoc", "1");
		Interface_EntityIterator RootEntities() const;
		%feature("autodoc", "1");
		void SetShare(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void SetShare(const Handle_Standard_Transient &ent, const Interface_EntityIterator &list);
		%feature("autodoc", "1");
		void SetShare(const Handle_Standard_Transient &ent, const Interface_IntList &list);
		%feature("autodoc", "1");
		void SetNoShare(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void SetNoShare(const Interface_EntityIterator &list);
		%feature("autodoc", "1");
		void AddShared(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &shared);
		%feature("autodoc", "1");
		void RemoveShared(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &shared);
		%feature("autodoc", "1");
		void ResetShare(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void ResetAllShare();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name(const Handle_Standard_Transient &ent) const;

};
%extend Interface_Graph {
	~Interface_Graph() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Graph\n");}
	}
};


%nodefaultctor Interface_SignType;
class Interface_SignType : public MoniTool_SignText {
	public:
		%feature("autodoc", "1");
		virtual		TCollection_AsciiString Text(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &context) const;
		%feature("autodoc", "1");
		virtual		char * Value(const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		char * ClassName(const char * typnam);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_SignType {
	Handle_Interface_SignType GetHandle() {
	return *(Handle_Interface_SignType*) &$self;
	}
};
%extend Interface_SignType {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_SignType {
	~Interface_SignType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_SignType\n");}
	}
};


%nodefaultctor Interface_DataMapNodeOfDataMapOfIntegerTransient;
class Interface_DataMapNodeOfDataMapOfIntegerTransient : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		Interface_DataMapNodeOfDataMapOfIntegerTransient(const Standard_Integer &K, const Handle_Standard_Transient &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Standard_Integer & Key() const;
		%feature("autodoc", "1");
		Handle_Standard_Transient & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_DataMapNodeOfDataMapOfIntegerTransient {
	Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient GetHandle() {
	return *(Handle_Interface_DataMapNodeOfDataMapOfIntegerTransient*) &$self;
	}
};
%extend Interface_DataMapNodeOfDataMapOfIntegerTransient {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_DataMapNodeOfDataMapOfIntegerTransient {
	~Interface_DataMapNodeOfDataMapOfIntegerTransient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapNodeOfDataMapOfIntegerTransient\n");}
	}
};


%nodefaultctor Interface_Check;
class Interface_Check : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_Check();
		%feature("autodoc", "1");
		Interface_Check(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void SendFail(const Message_Msg &amsg);
		%feature("autodoc", "1");
		void AddFail(const Handle_TCollection_HAsciiString &amess);
		%feature("autodoc", "1");
		void AddFail(const Handle_TCollection_HAsciiString &amess, const Handle_TCollection_HAsciiString &orig);
		%feature("autodoc", "1");
		void AddFail(const char * amess, const char * orig="");
		%feature("autodoc", "1");
		void AddFail(const Message_Msg &amsg);
		%feature("autodoc", "1");
		Standard_Boolean HasFailed() const;
		%feature("autodoc", "1");
		Standard_Integer NbFails() const;
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & Fail(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		char * CFail(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfHAsciiString Fails(const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		void SendWarning(const Message_Msg &amsg);
		%feature("autodoc", "1");
		void AddWarning(const Handle_TCollection_HAsciiString &amess);
		%feature("autodoc", "1");
		void AddWarning(const Handle_TCollection_HAsciiString &amess, const Handle_TCollection_HAsciiString &orig);
		%feature("autodoc", "1");
		void AddWarning(const char * amess, const char * orig="");
		%feature("autodoc", "1");
		void AddWarning(const Message_Msg &amsg);
		%feature("autodoc", "1");
		Standard_Boolean HasWarnings() const;
		%feature("autodoc", "1");
		Standard_Integer NbWarnings() const;
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & Warning(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		char * CWarning(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfHAsciiString Warnings(const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		void SendMsg(const Message_Msg &amsg);
		%feature("autodoc", "1");
		Standard_Integer NbInfoMsgs() const;
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & InfoMsg(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		char * CInfoMsg(const Standard_Integer num, const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfHAsciiString InfoMsgs(const Standard_Boolean final=1) const;
		%feature("autodoc", "1");
		Standard_Boolean Complies(const Interface_CheckStatus status) const;
		%feature("autodoc", "1");
		Standard_Boolean Complies(const Handle_TCollection_HAsciiString &mess, const Standard_Integer incl, const Interface_CheckStatus status) const;
		%feature("autodoc", "1");
		Standard_Boolean HasEntity() const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Entity() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void ClearFails();
		%feature("autodoc", "1");
		void ClearWarnings();
		%feature("autodoc", "1");
		void ClearInfoMsgs();
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Handle_TCollection_HAsciiString &mess, const Standard_Integer incl, const Interface_CheckStatus status);
		%feature("autodoc", "1");
		Standard_Boolean Mend(const char * pref, const Standard_Integer num=0);
		%feature("autodoc", "1");
		void SetEntity(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void GetEntity(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void GetMessages(const Handle_Interface_Check &other);
		%feature("autodoc", "1");
		void GetAsWarning(const Handle_Interface_Check &other, const Standard_Boolean failsonly);
		%feature("autodoc", "1");
		void Print(const Handle_Message_Messenger &S, const Standard_Integer level, const Standard_Integer final=1) const;
		%feature("autodoc", "1");
		void Trace(const Standard_Integer level=-0x000000001, const Standard_Integer final=1) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_Check {
	Handle_Interface_Check GetHandle() {
	return *(Handle_Interface_Check*) &$self;
	}
};
%extend Interface_Check {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_Check {
	~Interface_Check() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Check\n");}
	}
};


%nodefaultctor Interface_ReportEntity;
class Interface_ReportEntity : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_ReportEntity(const Handle_Standard_Transient &unknown);
		%feature("autodoc", "1");
		Interface_ReportEntity(const Handle_Interface_Check &acheck, const Handle_Standard_Transient &concerned);
		%feature("autodoc", "1");
		void SetContent(const Handle_Standard_Transient &content);
		%feature("autodoc", "1");
		const Handle_Interface_Check & Check() const;
		%feature("autodoc", "1");
		Handle_Interface_Check & CCheck();
		%feature("autodoc", "1");
		Handle_Standard_Transient Concerned() const;
		%feature("autodoc", "1");
		Standard_Boolean HasContent() const;
		%feature("autodoc", "1");
		Standard_Boolean HasNewContent() const;
		%feature("autodoc", "1");
		Handle_Standard_Transient Content() const;
		%feature("autodoc", "1");
		Standard_Boolean IsError() const;
		%feature("autodoc", "1");
		Standard_Boolean IsUnknown() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_ReportEntity {
	Handle_Interface_ReportEntity GetHandle() {
	return *(Handle_Interface_ReportEntity*) &$self;
	}
};
%extend Interface_ReportEntity {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_ReportEntity {
	~Interface_ReportEntity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ReportEntity\n");}
	}
};


%nodefaultctor Interface_SignLabel;
class Interface_SignLabel : public MoniTool_SignText {
	public:
		%feature("autodoc", "1");
		Interface_SignLabel();
		%feature("autodoc", "1");
		virtual		Standard_CString Name() const;
		%feature("autodoc", "1");
		virtual		TCollection_AsciiString Text(const Handle_Standard_Transient &ent, const Handle_Standard_Transient &context) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_SignLabel {
	Handle_Interface_SignLabel GetHandle() {
	return *(Handle_Interface_SignLabel*) &$self;
	}
};
%extend Interface_SignLabel {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_SignLabel {
	~Interface_SignLabel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_SignLabel\n");}
	}
};


%nodefaultctor Interface_HGraph;
class Interface_HGraph : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_HGraph(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		Interface_HGraph(const Handle_Interface_InterfaceModel &amodel, const Interface_GeneralLib &lib);
		%feature("autodoc", "1");
		Interface_HGraph(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_Protocol &protocol);
		%feature("autodoc", "1");
		Interface_HGraph(const Handle_Interface_InterfaceModel &amodel, const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Interface_HGraph(const Handle_Interface_InterfaceModel &amodel);
		%feature("autodoc", "1");
		const Interface_Graph & Graph() const;
		%feature("autodoc", "1");
		Interface_Graph & CGraph();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_HGraph {
	Handle_Interface_HGraph GetHandle() {
	return *(Handle_Interface_HGraph*) &$self;
	}
};
%extend Interface_HGraph {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_HGraph {
	~Interface_HGraph() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_HGraph\n");}
	}
};


%nodefaultctor Interface_CheckIterator;
class Interface_CheckIterator {
	public:
		%feature("autodoc", "1");
		Interface_CheckIterator();
		%feature("autodoc", "1");
		Interface_CheckIterator(const char * name);
		%feature("autodoc", "1");
		void SetName(const char * name);
		%feature("autodoc", "1");
		Standard_CString Name() const;
		%feature("autodoc", "1");
		void SetModel(const Handle_Interface_InterfaceModel &model);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Model() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Merge(Interface_CheckIterator & other);
		%feature("autodoc", "1");
		void Add(const Handle_Interface_Check &ach, const Standard_Integer num=0);
		%feature("autodoc", "1");
		const Handle_Interface_Check & Check(const Standard_Integer num) const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & Check(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_Interface_Check & CCheck(const Standard_Integer num);
		%feature("autodoc", "1");
		Handle_Interface_Check & CCheck(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty(const Standard_Boolean failsonly) const;
		%feature("autodoc", "1");
		Standard_Boolean Complies(const Interface_CheckStatus status) const;
		%feature("autodoc", "1");
		Interface_CheckIterator Extract(const Interface_CheckStatus status) const;
		%feature("autodoc", "1");
		Interface_CheckIterator Extract(const char * mess, const Standard_Integer incl, const Interface_CheckStatus status) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const char * mess, const Standard_Integer incl, const Interface_CheckStatus status);
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfTransient Checkeds(const Standard_Boolean failsonly, const Standard_Boolean global) const;
		%feature("autodoc", "1");
		void Start() const;
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next() const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & Value() const;
		%feature("autodoc", "1");
		Standard_Integer Number() const;
		%feature("autodoc", "1");
		void Print(const Handle_Message_Messenger &S, const Standard_Boolean failsonly, const Standard_Integer final=0) const;
		%feature("autodoc", "1");
		void Print(const Handle_Message_Messenger &S, const Handle_Interface_InterfaceModel &model, const Standard_Boolean failsonly, const Standard_Integer final=0) const;
		%feature("autodoc", "1");
		void Destroy();

};
%extend Interface_CheckIterator {
	~Interface_CheckIterator() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CheckIterator\n");}
	}
};


%nodefaultctor Interface_Protocol;
class Interface_Protocol : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_Interface_Protocol Active();
		%feature("autodoc", "1");
		void SetActive(const Handle_Interface_Protocol &aprotocol);
		%feature("autodoc", "1");
		void ClearActive();
		%feature("autodoc", "1");
		virtual		Standard_Integer NbResources() const;
		%feature("autodoc", "1");
		virtual		Handle_Interface_Protocol Resource(const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNumber(const Handle_Standard_Transient &obj) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsDynamicType(const Handle_Standard_Transient &obj) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NbTypes(const Handle_Standard_Transient &obj) const;
		%feature("autodoc", "1");
		Handle_Standard_Type Type(const Handle_Standard_Transient &obj, const Standard_Integer nt=1) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer TypeNumber(const Handle_Standard_Type &atype) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean GlobalCheck(const Interface_Graph &G, Handle_Interface_Check & ach) const;
		%feature("autodoc", "1");
		virtual		Handle_Interface_InterfaceModel NewModel() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsSuitableModel(const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		virtual		Handle_Standard_Transient UnknownEntity() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean IsUnknownEntity(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_Protocol {
	Handle_Interface_Protocol GetHandle() {
	return *(Handle_Interface_Protocol*) &$self;
	}
};
%extend Interface_Protocol {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_Protocol {
	~Interface_Protocol() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Protocol\n");}
	}
};


%nodefaultctor Interface_MapAsciiStringHasher;
class Interface_MapAsciiStringHasher {
	public:
		%feature("autodoc", "1");
		Interface_MapAsciiStringHasher();
		%feature("autodoc", "1");
		Standard_Integer HashCode(const TCollection_AsciiString &K, const Standard_Integer Upper);
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const TCollection_AsciiString &K1, const TCollection_AsciiString &K2);

};
%extend Interface_MapAsciiStringHasher {
	~Interface_MapAsciiStringHasher() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_MapAsciiStringHasher\n");}
	}
};


%nodefaultctor Interface_SequenceOfCheck;
class Interface_SequenceOfCheck : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		Interface_SequenceOfCheck();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		const Interface_SequenceOfCheck & Assign(const Interface_SequenceOfCheck &Other);
		%feature("autodoc", "1");
		const Interface_SequenceOfCheck & operator=(const Interface_SequenceOfCheck &Other);
		%feature("autodoc", "1");
		void Append(const Handle_Interface_Check &T);
		%feature("autodoc", "1");
		void Append(Interface_SequenceOfCheck & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_Interface_Check &T);
		%feature("autodoc", "1");
		void Prepend(Interface_SequenceOfCheck & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_Interface_Check &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, Interface_SequenceOfCheck & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_Interface_Check &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, Interface_SequenceOfCheck & S);
		%feature("autodoc", "1");
		const Handle_Interface_Check & First() const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, Interface_SequenceOfCheck & S);
		%feature("autodoc", "1");
		const Handle_Interface_Check & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_Interface_Check &I);
		%feature("autodoc", "1");
		Handle_Interface_Check & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_Interface_Check & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};
%extend Interface_SequenceOfCheck {
	~Interface_SequenceOfCheck() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_SequenceOfCheck\n");}
	}
};


%nodefaultctor Interface_GTool;
class Interface_GTool : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_GTool();
		%feature("autodoc", "1");
		Interface_GTool(const Handle_Interface_Protocol &proto, const Standard_Integer nbent=0);
		%feature("autodoc", "1");
		void SetSignType(const Handle_Interface_SignType &sign);
		%feature("autodoc", "1");
		Handle_Interface_SignType SignType() const;
		%feature("autodoc", "1");
		char * SignValue(const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		Standard_CString SignName() const;
		%feature("autodoc", "1");
		void SetProtocol(const Handle_Interface_Protocol &proto, const Standard_Boolean enforce=0);
		%feature("autodoc", "1");
		Handle_Interface_Protocol Protocol() const;
		%feature("autodoc", "1");
		Interface_GeneralLib & Lib();
		%feature("autodoc", "1");
		void Reservate(const Standard_Integer nb, const Standard_Boolean enforce=0);
		%feature("autodoc", "1");
		void ClearEntities();
		%feature("autodoc", "1");
		Standard_Boolean Select(const Handle_Standard_Transient &ent, Handle_Interface_GeneralModule & gmod, Standard_Integer &OutValue, const Standard_Boolean enforce=0);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_GTool {
	Handle_Interface_GTool GetHandle() {
	return *(Handle_Interface_GTool*) &$self;
	}
};
%extend Interface_GTool {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_GTool {
	~Interface_GTool() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GTool\n");}
	}
};


%nodefaultctor Interface_Category;
class Interface_Category {
	public:
		%feature("autodoc", "1");
		Interface_Category();
		%feature("autodoc", "1");
		Interface_Category(const Handle_Interface_Protocol &proto);
		%feature("autodoc", "1");
		Interface_Category(const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		void SetProtocol(const Handle_Interface_Protocol &proto);
		%feature("autodoc", "1");
		Standard_Integer CatNum(const Handle_Standard_Transient &ent, const Interface_ShareTool &shares);
		%feature("autodoc", "1");
		void ClearNums();
		%feature("autodoc", "1");
		void Compute(const Handle_Interface_InterfaceModel &model, const Interface_ShareTool &shares);
		%feature("autodoc", "1");
		Standard_Integer Num(const Standard_Integer nument) const;
		%feature("autodoc", "1");
		Standard_Integer AddCategory(const char * name);
		%feature("autodoc", "1");
		Standard_Integer NbCategories();
		%feature("autodoc", "1");
		char * Name(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Integer Number(const char * name);
		%feature("autodoc", "1");
		void Init();

};
%extend Interface_Category {
	~Interface_Category() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Category\n");}
	}
};


%nodefaultctor Interface_EntityIterator;
class Interface_EntityIterator {
	public:
		%feature("autodoc", "1");
		Interface_EntityIterator();
		%feature("autodoc", "1");
		Interface_EntityIterator(const Handle_TColStd_HSequenceOfTransient &list);
		%feature("autodoc", "1");
		void AddList(const Handle_TColStd_HSequenceOfTransient &list);
		%feature("autodoc", "1");
		void AddItem(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void GetOneItem(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void SelectType(const Handle_Standard_Type &atype, const Standard_Boolean keep);
		%feature("autodoc", "1");
		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		Standard_Integer NbTyped(const Handle_Standard_Type &type) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Typed(const Handle_Standard_Type &type) const;
		%feature("autodoc", "1");
		virtual		void Start() const;
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next() const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Value() const;
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfTransient Content() const;
		%feature("autodoc", "1");
		virtual		void Destroy();

};
%extend Interface_EntityIterator {
	~Interface_EntityIterator() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_EntityIterator\n");}
	}
};


%nodefaultctor Interface_GraphContent;
class Interface_GraphContent : public Interface_EntityIterator {
	public:
		%feature("autodoc", "1");
		Interface_GraphContent();
		%feature("autodoc", "1");
		Interface_GraphContent(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		Interface_GraphContent(const Interface_Graph &agraph, const Standard_Integer stat);
		%feature("autodoc", "1");
		Interface_GraphContent(const Interface_Graph &agraph, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void GetFromGraph(const Interface_Graph &agraph);
		%feature("autodoc", "1");
		void GetFromGraph(const Interface_Graph &agraph, const Standard_Integer stat);
		%feature("autodoc", "1");
		Interface_EntityIterator Result();
		%feature("autodoc", "1");
		void Begin();
		%feature("autodoc", "1");
		virtual		void Evaluate();

};
%extend Interface_GraphContent {
	~Interface_GraphContent() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_GraphContent\n");}
	}
};


%nodefaultctor Interface_IndexedMapOfAsciiString;
class Interface_IndexedMapOfAsciiString : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Interface_IndexedMapOfAsciiString(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Interface_IndexedMapOfAsciiString & Assign(const Interface_IndexedMapOfAsciiString &Other);
		%feature("autodoc", "1");
		Interface_IndexedMapOfAsciiString & operator=(const Interface_IndexedMapOfAsciiString &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Integer Add(const TCollection_AsciiString &K);
		%feature("autodoc", "1");
		void Substitute(const Standard_Integer I, const TCollection_AsciiString &K);
		%feature("autodoc", "1");
		void RemoveLast();
		%feature("autodoc", "1");
		Standard_Boolean Contains(const TCollection_AsciiString &K) const;
		%feature("autodoc", "1");
		const TCollection_AsciiString & FindKey(const Standard_Integer I) const;
		%feature("autodoc", "1");
		const TCollection_AsciiString & operator()(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Integer FindIndex(const TCollection_AsciiString &K) const;

};
%extend Interface_IndexedMapOfAsciiString {
	~Interface_IndexedMapOfAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_IndexedMapOfAsciiString\n");}
	}
};


%nodefaultctor Interface_DataMapOfTransientInteger;
class Interface_DataMapOfTransientInteger : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		Interface_DataMapOfTransientInteger(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		Interface_DataMapOfTransientInteger & Assign(const Interface_DataMapOfTransientInteger &Other);
		%feature("autodoc", "1");
		Interface_DataMapOfTransientInteger & operator=(const Interface_DataMapOfTransientInteger &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const Handle_Standard_Transient &K, const Standard_Integer &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const Handle_Standard_Transient &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const Handle_Standard_Transient &K);
		%feature("autodoc", "1");
		const Standard_Integer & Find(const Handle_Standard_Transient &K) const;
		%feature("autodoc", "1");
		const Standard_Integer & operator()(const Handle_Standard_Transient &K) const;
		%feature("autodoc", "1");
		Standard_Integer & ChangeFind(const Handle_Standard_Transient &K);
		%feature("autodoc", "1");
		Standard_Integer & operator()(const Handle_Standard_Transient &K);

};
%extend Interface_DataMapOfTransientInteger {
	~Interface_DataMapOfTransientInteger() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_DataMapOfTransientInteger\n");}
	}
};


%nodefaultctor Interface_CheckFailure;
class Interface_CheckFailure : public Interface_InterfaceError {
	public:
		%feature("autodoc", "1");
		Interface_CheckFailure();
		%feature("autodoc", "1");
		Interface_CheckFailure(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Interface_CheckFailure NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_CheckFailure {
	Handle_Interface_CheckFailure GetHandle() {
	return *(Handle_Interface_CheckFailure*) &$self;
	}
};
%extend Interface_CheckFailure {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_CheckFailure {
	~Interface_CheckFailure() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_CheckFailure\n");}
	}
};


%nodefaultctor Interface_NodeOfReaderLib;
class Interface_NodeOfReaderLib : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_NodeOfReaderLib();
		%feature("autodoc", "1");
		void AddNode(const Handle_Interface_GlobalNodeOfReaderLib &anode);
		%feature("autodoc", "1");
		const Handle_Interface_ReaderModule & Module() const;
		%feature("autodoc", "1");
		const Handle_Interface_Protocol & Protocol() const;
		%feature("autodoc", "1");
		const Handle_Interface_NodeOfReaderLib & Next() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_NodeOfReaderLib {
	Handle_Interface_NodeOfReaderLib GetHandle() {
	return *(Handle_Interface_NodeOfReaderLib*) &$self;
	}
};
%extend Interface_NodeOfReaderLib {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_NodeOfReaderLib {
	~Interface_NodeOfReaderLib() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_NodeOfReaderLib\n");}
	}
};


%nodefaultctor Interface_Array1OfHAsciiString;
class Interface_Array1OfHAsciiString {
	public:
		%feature("autodoc", "1");
		Interface_Array1OfHAsciiString(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		Interface_Array1OfHAsciiString(const Handle_TCollection_HAsciiString &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const Interface_Array1OfHAsciiString & Assign(const Interface_Array1OfHAsciiString &Other);
		%feature("autodoc", "1");
		const Interface_Array1OfHAsciiString & operator=(const Interface_Array1OfHAsciiString &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TCollection_HAsciiString &Value);
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TCollection_HAsciiString & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString & operator()(const Standard_Integer Index);

};
%extend Interface_Array1OfHAsciiString {
	~Interface_Array1OfHAsciiString() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_Array1OfHAsciiString\n");}
	}
};


%nodefaultctor Interface_InterfaceMismatch;
class Interface_InterfaceMismatch : public Interface_InterfaceError {
	public:
		%feature("autodoc", "1");
		Interface_InterfaceMismatch();
		%feature("autodoc", "1");
		Interface_InterfaceMismatch(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceMismatch NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_InterfaceMismatch {
	Handle_Interface_InterfaceMismatch GetHandle() {
	return *(Handle_Interface_InterfaceMismatch*) &$self;
	}
};
%extend Interface_InterfaceMismatch {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_InterfaceMismatch {
	~Interface_InterfaceMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_InterfaceMismatch\n");}
	}
};


%nodefaultctor Interface_LineBuffer;
class Interface_LineBuffer {
	public:
		%feature("autodoc", "1");
		Interface_LineBuffer(const Standard_Integer size=10);
		%feature("autodoc", "1");
		void SetMax(const Standard_Integer max);
		%feature("autodoc", "1");
		void SetInitial(const Standard_Integer initial);
		%feature("autodoc", "1");
		void SetKeep();
		%feature("autodoc", "1");
		Standard_Boolean CanGet(const Standard_Integer more);
		%feature("autodoc", "1");
		Standard_CString Content() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void FreezeInitial();
		%feature("autodoc", "1");
		void Move(TCollection_AsciiString & str);
		%feature("autodoc", "1");
		void Move(const Handle_TCollection_HAsciiString &str);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Moved();
		%feature("autodoc", "1");
		void Add(const char * text);
		%feature("autodoc", "1");
		void Add(const char * text, const Standard_Integer lntext);
		%feature("autodoc", "1");
		void Add(const TCollection_AsciiString &text);
		%feature("autodoc", "1");
		void Add(const Standard_Character text);

};
%extend Interface_LineBuffer {
	~Interface_LineBuffer() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_LineBuffer\n");}
	}
};


%nodefaultctor Interface_ParamSet;
class Interface_ParamSet : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_ParamSet(const Standard_Integer nres, const Standard_Integer nst=1);
		%feature("autodoc", "1");
		Standard_Integer Append(const char * val, const Standard_Integer lnval, const Interface_ParamType typ, const Standard_Integer nument);
		%feature("autodoc", "1");
		Standard_Integer Append(const Interface_FileParameter &FP);
		%feature("autodoc", "1");
		Standard_Integer NbParams() const;
		%feature("autodoc", "1");
		const Interface_FileParameter & Param(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Interface_FileParameter & ChangeParam(const Standard_Integer num);
		%feature("autodoc", "1");
		void SetParam(const Standard_Integer num, const Interface_FileParameter &FP);
		%feature("autodoc", "1");
		Handle_Interface_ParamList Params(const Standard_Integer num, const Standard_Integer nb) const;
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_ParamSet {
	Handle_Interface_ParamSet GetHandle() {
	return *(Handle_Interface_ParamSet*) &$self;
	}
};
%extend Interface_ParamSet {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_ParamSet {
	~Interface_ParamSet() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_ParamSet\n");}
	}
};


%nodefaultctor Interface_InterfaceModel;
class Interface_InterfaceModel : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		void SetProtocol(const Handle_Interface_Protocol &proto);
		%feature("autodoc", "1");
		virtual		Handle_Interface_Protocol Protocol() const;
		%feature("autodoc", "1");
		void SetGTool(const Handle_Interface_GTool &gtool);
		%feature("autodoc", "1");
		Handle_Interface_GTool GTool() const;
		%feature("autodoc", "1");
		Standard_Boolean & DispatchStatus();
		%feature("autodoc", "1");
		virtual		void Clear();
		%feature("autodoc", "1");
		virtual		void ClearEntities();
		%feature("autodoc", "1");
		virtual		void ClearLabels();
		%feature("autodoc", "1");
		virtual		void ClearHeader();
		%feature("autodoc", "1");
		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		Standard_Boolean Contains(const Handle_Standard_Transient &anentity) const;
		%feature("autodoc", "1");
		Standard_Integer Number(const Handle_Standard_Transient &anentity) const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Value(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbTypes(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_Standard_Type Type(const Handle_Standard_Transient &ent, const Standard_Integer num=1) const;
		%feature("autodoc", "1");
		char * TypeName(const Handle_Standard_Transient &ent, const Standard_Boolean complete=1) const;
		%feature("autodoc", "1");
		char * ClassName(const char * typnam);
		%feature("autodoc", "1");
		Interface_DataState EntityState(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean IsReportEntity(const Standard_Integer num, const Standard_Boolean semantic=0) const;
		%feature("autodoc", "1");
		Handle_Interface_ReportEntity ReportEntity(const Standard_Integer num, const Standard_Boolean semantic=0) const;
		%feature("autodoc", "1");
		Standard_Boolean IsErrorEntity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean IsRedefinedContent(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Boolean ClearReportEntity(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Boolean SetReportEntity(const Standard_Integer num, const Handle_Interface_ReportEntity &rep);
		%feature("autodoc", "1");
		Standard_Boolean AddReportEntity(const Handle_Interface_ReportEntity &rep, const Standard_Boolean semantic=0);
		%feature("autodoc", "1");
		Standard_Boolean IsUnknownEntity(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void FillSemanticChecks(const Interface_CheckIterator &checks, const Standard_Boolean clear=1);
		%feature("autodoc", "1");
		Standard_Boolean HasSemanticChecks() const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & Check(const Standard_Integer num, const Standard_Boolean syntactic) const;
		%feature("autodoc", "1");
		virtual		void Reservate(const Standard_Integer nbent);
		%feature("autodoc", "1");
		virtual		void AddEntity(const Handle_Standard_Transient &anentity);
		%feature("autodoc", "1");
		void AddWithRefs(const Handle_Standard_Transient &anent, const Handle_Interface_Protocol &proto, const Standard_Integer level=0, const Standard_Boolean listall=0);
		%feature("autodoc", "1");
		void AddWithRefs(const Handle_Standard_Transient &anent, const Standard_Integer level=0, const Standard_Boolean listall=0);
		%feature("autodoc", "1");
		void AddWithRefs(const Handle_Standard_Transient &anent, const Interface_GeneralLib &lib, const Standard_Integer level=0, const Standard_Boolean listall=0);
		%feature("autodoc", "1");
		void ReplaceEntity(const Standard_Integer nument, const Handle_Standard_Transient &anent);
		%feature("autodoc", "1");
		void ReverseOrders(const Standard_Integer after=0);
		%feature("autodoc", "1");
		void ChangeOrder(const Standard_Integer oldnum, const Standard_Integer newnum, const Standard_Integer count=1);
		%feature("autodoc", "1");
		void GetFromTransfer(const Interface_EntityIterator &aniter);
		%feature("autodoc", "1");
		virtual		void GetFromAnother(const Handle_Interface_InterfaceModel &other);
		%feature("autodoc", "1");
		virtual		Handle_Interface_InterfaceModel NewEmptyModel() const;
		%feature("autodoc", "1");
		Standard_Boolean SetCategoryNumber(const Standard_Integer num, const Standard_Integer val);
		%feature("autodoc", "1");
		Standard_Integer CategoryNumber(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void FillIterator(Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Entities() const;
		%feature("autodoc", "1");
		Interface_EntityIterator Reports(const Standard_Boolean semantic=0) const;
		%feature("autodoc", "1");
		Interface_EntityIterator Redefineds() const;
		%feature("autodoc", "1");
		const Handle_Interface_Check & GlobalCheck(const Standard_Boolean syntactic=1) const;
		%feature("autodoc", "1");
		void SetGlobalCheck(const Handle_Interface_Check &ach);
		%feature("autodoc", "1");
		virtual		void VerifyCheck(Handle_Interface_Check & ach) const;
		%feature("autodoc", "1");
		virtual		void DumpHeader(const Handle_Message_Messenger &S, const Standard_Integer level=0) const;
		%feature("autodoc", "1");
		void Print(const Handle_Standard_Transient &ent, const Handle_Message_Messenger &s, const Standard_Integer mode=0) const;
		%feature("autodoc", "1");
		virtual		void PrintLabel(const Handle_Standard_Transient &ent, const Handle_Message_Messenger &S) const;
		%feature("autodoc", "1");
		virtual		void PrintToLog(const Handle_Standard_Transient &ent, const Handle_Message_Messenger &S) const;
		%feature("autodoc", "1");
		virtual		Handle_TCollection_HAsciiString StringLabel(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer NextNumberForLabel(const char * label, const Standard_Integer lastnum=0, const Standard_Boolean exact=1) const;
		%feature("autodoc", "1");
		Standard_Boolean HasTemplate(const char * name);
		%feature("autodoc", "1");
		Handle_Interface_InterfaceModel Template(const char * name);
		%feature("autodoc", "1");
		Standard_Boolean SetTemplate(const char * name, const Handle_Interface_InterfaceModel &model);
		%feature("autodoc", "1");
		Handle_TColStd_HSequenceOfHAsciiString ListTemplates();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_InterfaceModel {
	Handle_Interface_InterfaceModel GetHandle() {
	return *(Handle_Interface_InterfaceModel*) &$self;
	}
};
%extend Interface_InterfaceModel {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_InterfaceModel {
	~Interface_InterfaceModel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_InterfaceModel\n");}
	}
};


%nodefaultctor Interface_EntityCluster;
class Interface_EntityCluster : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Interface_EntityCluster();
		%feature("autodoc", "1");
		Interface_EntityCluster(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		Interface_EntityCluster(const Handle_Interface_EntityCluster &ec);
		%feature("autodoc", "1");
		Interface_EntityCluster(const Handle_Standard_Transient &ant, const Handle_Interface_EntityCluster &ec);
		%feature("autodoc", "1");
		void Append(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Integer NbEntities() const;
		%feature("autodoc", "1");
		const Handle_Standard_Transient & Value(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer num, const Handle_Standard_Transient &ent);
		%feature("autodoc", "1");
		void FillIterator(Interface_EntityIterator & iter) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Interface_EntityCluster {
	Handle_Interface_EntityCluster GetHandle() {
	return *(Handle_Interface_EntityCluster*) &$self;
	}
};
%extend Interface_EntityCluster {
	Standard_Integer __hash__() {
	return $self->HashCode(__PYTHONOCC_MAXINT__);
	}
};
%extend Interface_EntityCluster {
	~Interface_EntityCluster() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_EntityCluster\n");}
	}
};


%nodefaultctor Interface_FileParameter;
class Interface_FileParameter {
	public:
		%feature("autodoc", "1");
		Interface_FileParameter();
		%feature("autodoc", "1");
		void Init(const TCollection_AsciiString &val, const Interface_ParamType typ);
		%feature("autodoc", "1");
		void Init(const char * val, const Interface_ParamType typ);
		%feature("autodoc", "1");
		Standard_CString CValue() const;
		%feature("autodoc", "1");
		Interface_ParamType ParamType() const;
		%feature("autodoc", "1");
		void SetEntityNumber(const Standard_Integer num);
		%feature("autodoc", "1");
		Standard_Integer EntityNumber() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Destroy();

};
%extend Interface_FileParameter {
	~Interface_FileParameter() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Interface_FileParameter\n");}
	}
};