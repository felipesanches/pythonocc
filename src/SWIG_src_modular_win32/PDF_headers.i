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
along with Foobar.  If not, see <http://www.gnu.org/licenses/>.

*/
%{

// Headers necessary to define wrapped classes.

#include<Handle_PDF_Attribute.hxx>
#include<Handle_PDF_Data.hxx>
#include<Handle_PDF_HAttributeArray1.hxx>
#include<Handle_PDF_Reference.hxx>
#include<Handle_PDF_TagSource.hxx>
#include<Handle_PDF_VArrayNodeOfFieldOfHAttributeArray1.hxx>
#include<PDF_Attribute.hxx>
#include<PDF_Data.hxx>
#include<PDF_FieldOfHAttributeArray1.hxx>
#include<PDF_HAttributeArray1.hxx>
#include<PDF_Reference.hxx>
#include<PDF_TagSource.hxx>
#include<PDF_VArrayNodeOfFieldOfHAttributeArray1.hxx>
#include<PDF_VArrayTNodeOfFieldOfHAttributeArray1.hxx>

// Additional headers necessary for compilation.

#include<PDF_Attribute.hxx>
#include<PDF_Data.hxx>
#include<PDF_FieldOfHAttributeArray1.hxx>
#include<PDF_HAttributeArray1.hxx>
#include<PDF_Reference.hxx>
#include<PDF_TagSource.hxx>
#include<PDF_VArrayNodeOfFieldOfHAttributeArray1.hxx>
#include<PDF_VArrayTNodeOfFieldOfHAttributeArray1.hxx>

// Needed headers necessary for compilation.

#include<Handle_Standard_Persistent.hxx>
#include<Storage_stCONSTclCOM.hxx>
#include<Handle_PCollection_HAsciiString.hxx>
#include<Handle_PColStd_HArray1OfInteger.hxx>
%}