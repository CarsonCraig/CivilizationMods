-- Buildings
------------------------------	
INSERT INTO Buildings 	
	(Type, BuildingClass, Happiness, Defense, ExtraCityHitPoints, CityWall, Cost, GoldMaintenance, PrereqTech, ArtDefineTag, XBuiltTriggersIdeologyChoice, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, Help, Description, Civilopedia, Strategy, IconAtlas, PortraitIndex)
SELECT	'BUILDING_3UC_DOLMEN', BuildingClass, Happiness, Defense, ExtraCityHitPoints,CityWall,  Cost, GoldMaintenance, PrereqTech, ArtDefineTag, XBuiltTriggersIdeologyChoice, SpecialistType, SpecialistCount, MinAreaSize, ConquestProb, HurryCostModifier, 'TXT_KEY_BUILDING_3UC_DOLMEN_HELP', 'TXT_KEY_BUILDING_3UC_DOLMEN', 'TXT_KEY_BUILDING_3UC_DOLMEN_TEXT', 'TXT_KEY_BUILDING_3UC_DOLMEN_STRATEGY', '3UC_DOLMEN_ATLAS', 0
FROM Buildings WHERE Type = 'BUILDING_MONUMENT';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_3UC_DOLMEN',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MONUMENT';
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_3UC_DOLMEN',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MONUMENT';
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
	VALUES('BUILDING_3UC_DOLMEN',	'YIELD_CULTURE', 4);

------------------------------	
-- Building_DomainProductionModifiers
------------------------------
INSERT INTO Building_DomainProductionModifiers 	
			(BuildingType, DomainType, Modifier)
SELECT	'BUILDING_3UC_DOLMEN',	DomainType, Modifier
FROM Building_DomainProductionModifiers WHERE BuildingType = 'BUILDING_MONUMENT';

------------------------------	
-- Building_UnitCombatProductionModifiers
------------------------------
INSERT INTO Building_UnitCombatProductionModifiers 	
			(BuildingType, UnitCombatType, Modifier)
SELECT	'BUILDING_3UC_DOLMEN',	 UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_MONUMENT';

------------------------------	
-- Building_ResourceQuantityRequirements
------------------------------
INSERT INTO Building_ResourceQuantityRequirements 	
			(BuildingType, ResourceType, Cost)
SELECT 'BUILDING_3UC_DOLMEN', ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_MONUMENT';

------------------------------	
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldModifiers 	
			(BuildingType, YieldType, Yield)
SELECT 'BUILDING_3UC_DOLMEN', YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_MONUMENT';

------------------------------	
-- Building_ResourceYieldChanges
------------------------------
INSERT INTO Building_ResourceYieldChanges 	
			(BuildingType, ResourceType, YieldType, Yield)
SELECT 'BUILDING_3UC_DOLMEN', ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges  WHERE BuildingType = 'BUILDING_MONUMENT';

--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_FRANCE',	'BUILDINGCLASS_MONUMENT',	'BUILDING_3UC_DOLMEN');


