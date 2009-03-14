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
#include <Select2D_Projector.hxx>
#include <Select2D_SensitiveArc.hxx>
#include <Select2D_SensitiveBox.hxx>
#include <Select2D_SensitiveCircle.hxx>
#include <Select2D_SensitiveEntity.hxx>
#include <Select2D_SensitivePoint.hxx>
#include <Select2D_SensitiveSegment.hxx>
#include <Select2D_TypeOfSelection.hxx>
#include <Handle_Select2D_Projector.hxx>
#include <Handle_Select2D_SensitiveArc.hxx>
#include <Handle_Select2D_SensitiveBox.hxx>
#include <Handle_Select2D_SensitiveCircle.hxx>
#include <Handle_Select2D_SensitiveEntity.hxx>
#include <Handle_Select2D_SensitivePoint.hxx>
#include <Handle_Select2D_SensitiveSegment.hxx>
#include <SelectMgr_AndFilter.hxx>
#include <SelectMgr_CompareResults.hxx>
#include <SelectMgr_CompositionFilter.hxx>
#include <SelectMgr_DataMapIteratorOfDataMapOfIntegerSensitive.hxx>
#include <SelectMgr_DataMapIteratorOfDataMapOfObjectSelectors.hxx>
#include <SelectMgr_DataMapIteratorOfDataMapOfSelectionActivation.hxx>
#include <SelectMgr_DataMapNodeOfDataMapOfIntegerSensitive.hxx>
#include <SelectMgr_DataMapNodeOfDataMapOfObjectSelectors.hxx>
#include <SelectMgr_DataMapNodeOfDataMapOfSelectionActivation.hxx>
#include <SelectMgr_DataMapOfIntegerSensitive.hxx>
#include <SelectMgr_DataMapOfObjectOwners.hxx>
#include <SelectMgr_DataMapOfObjectSelectors.hxx>
#include <SelectMgr_DataMapOfSelectionActivation.hxx>
#include <SelectMgr_EntityOwner.hxx>
#include <SelectMgr_Filter.hxx>
#include <SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion.hxx>
#include <SelectMgr_IndexedDataMapOfOwnerCriterion.hxx>
#include <SelectMgr_IndexedMapNodeOfIndexedMapOfOwner.hxx>
#include <SelectMgr_IndexedMapOfOwner.hxx>
#include <SelectMgr_ListIteratorOfListOfFilter.hxx>
#include <SelectMgr_ListNodeOfListOfFilter.hxx>
#include <SelectMgr_ListOfFilter.hxx>
#include <SelectMgr_OrFilter.hxx>
#include <SelectMgr_SelectableObject.hxx>
#include <SelectMgr_Selection.hxx>
#include <SelectMgr_SelectionManager.hxx>
#include <SelectMgr_SequenceNodeOfSequenceOfFilter.hxx>
#include <SelectMgr_SequenceNodeOfSequenceOfOwner.hxx>
#include <SelectMgr_SequenceNodeOfSequenceOfSelection.hxx>
#include <SelectMgr_SequenceNodeOfSequenceOfSelector.hxx>
#include <SelectMgr_SequenceOfFilter.hxx>
#include <SelectMgr_SequenceOfOwner.hxx>
#include <SelectMgr_SequenceOfSelection.hxx>
#include <SelectMgr_SequenceOfSelector.hxx>
#include <SelectMgr_SOPtr.hxx>
#include <SelectMgr_SortCriterion.hxx>
#include <SelectMgr_StateOfSelection.hxx>
#include <SelectMgr_TypeOfUpdate.hxx>
#include <SelectMgr_ViewerSelector.hxx>
#include <Handle_SelectMgr_AndFilter.hxx>
#include <Handle_SelectMgr_CompositionFilter.hxx>
#include <Handle_SelectMgr_DataMapNodeOfDataMapOfIntegerSensitive.hxx>
#include <Handle_SelectMgr_DataMapNodeOfDataMapOfObjectSelectors.hxx>
#include <Handle_SelectMgr_DataMapNodeOfDataMapOfSelectionActivation.hxx>
#include <Handle_SelectMgr_EntityOwner.hxx>
#include <Handle_SelectMgr_Filter.hxx>
#include <Handle_SelectMgr_IndexedDataMapNodeOfIndexedDataMapOfOwnerCriterion.hxx>
#include <Handle_SelectMgr_IndexedMapNodeOfIndexedMapOfOwner.hxx>
#include <Handle_SelectMgr_ListNodeOfListOfFilter.hxx>
#include <Handle_SelectMgr_OrFilter.hxx>
#include <Handle_SelectMgr_SelectableObject.hxx>
#include <Handle_SelectMgr_Selection.hxx>
#include <Handle_SelectMgr_SelectionManager.hxx>
#include <Handle_SelectMgr_SequenceNodeOfSequenceOfFilter.hxx>
#include <Handle_SelectMgr_SequenceNodeOfSequenceOfOwner.hxx>
#include <Handle_SelectMgr_SequenceNodeOfSequenceOfSelection.hxx>
#include <Handle_SelectMgr_SequenceNodeOfSequenceOfSelector.hxx>
#include <Handle_SelectMgr_ViewerSelector.hxx>
#include <Handle_TCollection_AVLBaseNode.hxx>
#include <Handle_TCollection_HAsciiString.hxx>
#include <Handle_TCollection_HExtendedString.hxx>
#include <Handle_TCollection_MapNode.hxx>
#include <Handle_TCollection_SeqNode.hxx>
#include <PrsMgr_KindOfPrs.hxx>
#include <PrsMgr_ModedPresentation.hxx>
#include <PrsMgr_PresentableObject.hxx>
#include <PrsMgr_PresentableObjectPointer.hxx>
#include <PrsMgr_Presentation.hxx>
#include <PrsMgr_Presentation2d.hxx>
#include <PrsMgr_Presentation3d.hxx>
#include <PrsMgr_Presentation3dPointer.hxx>
#include <PrsMgr_PresentationManager.hxx>
#include <PrsMgr_PresentationManager2d.hxx>
#include <PrsMgr_PresentationManager3d.hxx>
#include <PrsMgr_Presentations.hxx>
#include <PrsMgr_Prs.hxx>
#include <PrsMgr_SequenceNodeOfPresentations.hxx>
#include <PrsMgr_TypeOfPresentation3d.hxx>
#include <Handle_PrsMgr_PresentableObject.hxx>
#include <Handle_PrsMgr_Presentation.hxx>
#include <Handle_PrsMgr_Presentation2d.hxx>
#include <Handle_PrsMgr_Presentation3d.hxx>
#include <Handle_PrsMgr_PresentationManager.hxx>
#include <Handle_PrsMgr_PresentationManager2d.hxx>
#include <Handle_PrsMgr_PresentationManager3d.hxx>
#include <Handle_PrsMgr_Prs.hxx>
#include <Handle_PrsMgr_SequenceNodeOfPresentations.hxx>
#include <Prs3d_AngleAspect.hxx>
#include <Prs3d_AnglePresentation.hxx>
#include <Prs3d_Arrow.hxx>
#include <Prs3d_ArrowAspect.hxx>
#include <Prs3d_BasicAspect.hxx>
#include <Prs3d_CompositeAspect.hxx>
#include <Prs3d_DatumAspect.hxx>
#include <Prs3d_Drawer.hxx>
#include <Prs3d_InvalidAngle.hxx>
#include <Prs3d_IsoAspect.hxx>
#include <Prs3d_LengthAspect.hxx>
#include <Prs3d_LengthPresentation.hxx>
#include <Prs3d_LineAspect.hxx>
#include <Prs3d_NListIteratorOfListOfSequenceOfPnt.hxx>
#include <Prs3d_NListOfSequenceOfPnt.hxx>
#include <Prs3d_PlaneAspect.hxx>
#include <Prs3d_PlaneSet.hxx>
#include <Prs3d_PointAspect.hxx>
#include <Prs3d_Presentation.hxx>
#include <Prs3d_Projector.hxx>
#include <Prs3d_RadiusAspect.hxx>
#include <Prs3d_Root.hxx>
#include <Prs3d_ShadingAspect.hxx>
#include <Prs3d_ShapeTool.hxx>
#include <Prs3d_Text.hxx>
#include <Prs3d_TextAspect.hxx>
#include <Prs3d_TypeOfLinePicking.hxx>
#include <Handle_Prs3d_AngleAspect.hxx>
#include <Handle_Prs3d_ArrowAspect.hxx>
#include <Handle_Prs3d_BasicAspect.hxx>
#include <Handle_Prs3d_CompositeAspect.hxx>
#include <Handle_Prs3d_DatumAspect.hxx>
#include <Handle_Prs3d_Drawer.hxx>
#include <Handle_Prs3d_InvalidAngle.hxx>
#include <Handle_Prs3d_IsoAspect.hxx>
#include <Handle_Prs3d_LengthAspect.hxx>
#include <Handle_Prs3d_LineAspect.hxx>
#include <Handle_Prs3d_PlaneAspect.hxx>
#include <Handle_Prs3d_PlaneSet.hxx>
#include <Handle_Prs3d_PointAspect.hxx>
#include <Handle_Prs3d_Presentation.hxx>
#include <Handle_Prs3d_Projector.hxx>
#include <Handle_Prs3d_RadiusAspect.hxx>
#include <Handle_Prs3d_ShadingAspect.hxx>
#include <Handle_Prs3d_TextAspect.hxx>
#include <Standard_AbortiveTransaction.hxx>
#include <Standard_Address.hxx>
#include <Standard_AncestorIterator.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Byte.hxx>
#include <Standard_Character.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_CString.hxx>
#include <Standard_ctype.hxx>
#include <Standard_DefineHandle.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_DivideByZero.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_ErrorHandler.hxx>
#include <Standard_ErrorHandlerCallback.hxx>
#include <Standard_ExtCharacter.hxx>
#include <Standard_ExtString.hxx>
#include <Standard_Failure.hxx>
#include <Standard_GUID.hxx>
#include <Standard_HandlerStatus.hxx>
#include <Standard_ImmutableObject.hxx>
#include <Standard_Integer.hxx>
#include <Standard_InternalType.hxx>
#include <Standard_IStream.hxx>
#include <Standard_JmpBuf.hxx>
#include <Standard_KindOfType.hxx>
#include <Standard_LicenseError.hxx>
#include <Standard_LicenseNotFound.hxx>
#include <Standard_Macro.hxx>
#include <Standard_math.hxx>
#include <Standard_MMgrOpt.hxx>
#include <Standard_MMgrRaw.hxx>
#include <Standard_MMgrRoot.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_Mutex.hxx>
#include <Standard_NegativeValue.hxx>
#include <Standard_NoMoreObject.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OId.hxx>
#include <Standard_OStream.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_PCharacter.hxx>
#include <Standard_PErrorHandler.hxx>
#include <Standard_Persistent.hxx>
#include <Standard_Persistent_proto.hxx>
#include <Standard_PExtCharacter.hxx>
#include <Standard_PrimitiveTypes.hxx>
#include <Standard_ProgramError.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Real.hxx>
#include <Standard_ShortReal.hxx>
#include <Standard_Size.hxx>
#include <Standard_SStream.hxx>
#include <Standard_Static.hxx>
#include <Standard_Storable.hxx>
#include <Standard_Stream.hxx>
#include <Standard_String.hxx>
#include <Standard_ThreadId.hxx>
#include <Standard_TooManyUsers.hxx>
#include <Standard_Transient.hxx>
#include <Standard_Type.hxx>
#include <Standard_TypeDef.hxx>
#include <Standard_TypeMismatch.hxx>
#include <Standard_Underflow.hxx>
#include <Standard_UUID.hxx>
#include <Standard_Version.hxx>
#include <Standard_WayOfLife.hxx>
#include <Handle_Standard_AbortiveTransaction.hxx>
#include <Handle_Standard_ConstructionError.hxx>
#include <Handle_Standard_DimensionError.hxx>
#include <Handle_Standard_DimensionMismatch.hxx>
#include <Handle_Standard_DivideByZero.hxx>
#include <Handle_Standard_DomainError.hxx>
#include <Handle_Standard_Failure.hxx>
#include <Handle_Standard_ImmutableObject.hxx>
#include <Handle_Standard_LicenseError.hxx>
#include <Handle_Standard_LicenseNotFound.hxx>
#include <Handle_Standard_MultiplyDefined.hxx>
#include <Handle_Standard_NegativeValue.hxx>
#include <Handle_Standard_NoMoreObject.hxx>
#include <Handle_Standard_NoSuchObject.hxx>
#include <Handle_Standard_NotImplemented.hxx>
#include <Handle_Standard_NullObject.hxx>
#include <Handle_Standard_NullValue.hxx>
#include <Handle_Standard_NumericError.hxx>
#include <Handle_Standard_OutOfMemory.hxx>
#include <Handle_Standard_OutOfRange.hxx>
#include <Handle_Standard_Overflow.hxx>
#include <Handle_Standard_Persistent.hxx>
#include <Handle_Standard_ProgramError.hxx>
#include <Handle_Standard_RangeError.hxx>
#include <Handle_Standard_TooManyUsers.hxx>
#include <Handle_Standard_Transient.hxx>
#include <Handle_Standard_Type.hxx>
#include <Handle_Standard_TypeMismatch.hxx>
#include <Handle_Standard_Underflow.hxx>
#include <TopAbs_Orientation.hxx>
#include <TopAbs_ShapeEnum.hxx>
#include <TopAbs_State.hxx>
#include <Quantity_AbsorbedDose.hxx>
#include <Quantity_Acceleration.hxx>
#include <Quantity_AcousticIntensity.hxx>
#include <Quantity_Activity.hxx>
#include <Quantity_Admittance.hxx>
#include <Quantity_AmountOfSubstance.hxx>
#include <Quantity_AngularVelocity.hxx>
#include <Quantity_Area.hxx>
#include <Quantity_Array1OfCoefficient.hxx>
#include <Quantity_Array1OfColor.hxx>
#include <Quantity_Array2OfColor.hxx>
#include <Quantity_Capacitance.hxx>
#include <Quantity_Coefficient.hxx>
#include <Quantity_CoefficientOfExpansion.hxx>
#include <Quantity_Color.hxx>
#include <Quantity_ColorDefinitionError.hxx>
#include <Quantity_Color_1.hxx>
#include <Quantity_Concentration.hxx>
#include <Quantity_Conductivity.hxx>
#include <Quantity_Constant.hxx>
#include <Quantity_Consumption.hxx>
#include <Quantity_Content.hxx>
#include <Quantity_Convert.hxx>
#include <Quantity_Date.hxx>
#include <Quantity_DateDefinitionError.hxx>
#include <Quantity_Density.hxx>
#include <Quantity_DoseEquivalent.hxx>
#include <Quantity_ElectricCapacitance.hxx>
#include <Quantity_ElectricCharge.hxx>
#include <Quantity_ElectricCurrent.hxx>
#include <Quantity_ElectricFieldStrength.hxx>
#include <Quantity_ElectricPotential.hxx>
#include <Quantity_Energy.hxx>
#include <Quantity_Enthalpy.hxx>
#include <Quantity_Entropy.hxx>
#include <Quantity_Factor.hxx>
#include <Quantity_Force.hxx>
#include <Quantity_Frequency.hxx>
#include <Quantity_HArray1OfColor.hxx>
#include <Quantity_Illuminance.hxx>
#include <Quantity_Impedance.hxx>
#include <Quantity_Index.hxx>
#include <Quantity_Inductance.hxx>
#include <Quantity_KinematicViscosity.hxx>
#include <Quantity_KineticMoment.hxx>
#include <Quantity_Length.hxx>
#include <Quantity_Luminance.hxx>
#include <Quantity_LuminousEfficacity.hxx>
#include <Quantity_LuminousExposition.hxx>
#include <Quantity_LuminousFlux.hxx>
#include <Quantity_LuminousIntensity.hxx>
#include <Quantity_MagneticFieldStrength.hxx>
#include <Quantity_MagneticFlux.hxx>
#include <Quantity_MagneticFluxDensity.hxx>
#include <Quantity_Mass.hxx>
#include <Quantity_MassFlow.hxx>
#include <Quantity_MolarConcentration.hxx>
#include <Quantity_Molarity.hxx>
#include <Quantity_MolarMass.hxx>
#include <Quantity_MolarVolume.hxx>
#include <Quantity_MomentOfAForce.hxx>
#include <Quantity_MomentOfInertia.hxx>
#include <Quantity_Momentum.hxx>
#include <Quantity_NameOfColor.hxx>
#include <Quantity_Normality.hxx>
#include <Quantity_Parameter.hxx>
#include <Quantity_Period.hxx>
#include <Quantity_PeriodDefinitionError.hxx>
#include <Quantity_PhysicalQuantity.hxx>
#include <Quantity_PlaneAngle.hxx>
#include <Quantity_Power.hxx>
#include <Quantity_Pressure.hxx>
#include <Quantity_Quotient.hxx>
#include <Quantity_Rate.hxx>
#include <Quantity_Ratio.hxx>
#include <Quantity_Reluctance.hxx>
#include <Quantity_Resistance.hxx>
#include <Quantity_Resistivity.hxx>
#include <Quantity_Scalaire.hxx>
#include <Quantity_SolidAngle.hxx>
#include <Quantity_SoundIntensity.hxx>
#include <Quantity_SpecificHeatCapacity.hxx>
#include <Quantity_Speed.hxx>
#include <Quantity_SurfaceTension.hxx>
#include <Quantity_Temperature.hxx>
#include <Quantity_ThermalConductivity.hxx>
#include <Quantity_Torque.hxx>
#include <Quantity_TypeOfColor.hxx>
#include <Quantity_Velocity.hxx>
#include <Quantity_Viscosity.hxx>
#include <Quantity_Volume.hxx>
#include <Quantity_VolumeFlow.hxx>
#include <Quantity_Weight.hxx>
#include <Quantity_Work.hxx>
#include <Handle_Quantity_ColorDefinitionError.hxx>
#include <Handle_Quantity_DateDefinitionError.hxx>
#include <Handle_Quantity_HArray1OfColor.hxx>
#include <Handle_Quantity_PeriodDefinitionError.hxx>
%};

%import Select2D.i
%import SelectMgr.i
%import TCollection.i
%import PrsMgr.i
%import Prs3d.i
%import Standard.i
%import TopAbs.i
%import Quantity.i