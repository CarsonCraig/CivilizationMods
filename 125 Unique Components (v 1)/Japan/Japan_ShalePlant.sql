--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,		BuildingClass,					MutuallyExclusiveGroup,	PrereqTech,			EnhancedYieldTech,	NeverCapture,	Cost,	GoldMaintenance,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,						Help,									Strategy,									Civilopedia,								ArtDefineTag,						MinAreaSize) 
SELECT 'BUILDING_FA_SHALEPLANT',	'BUILDINGCLASS_HYDRO_PLANT',	1,						'TECH_BIOLOGY',		'TECH_PLASTIC',		1,				360,	4,					0,					'FA_UB_ATLAS',		11,				'TXT_KEY_BUILDING_FA_SHALEPLANT',	'TXT_KEY_BUILDING_FA_SHALEPLANT_HELP',	'TXT_KEY_BUILDING_FA_SHALEPLANT_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_HYDROPLANT_TEXT',	'ART_DEF_BUILDING_HYDRO_PLANT',		-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_SHALEPLANT',							'BUILDINGCLASS_FACTORY';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_SHALEPLANT',					'YIELD_PRODUCTION',		2;

--------------------------------------------------------------------------------------------------
--Building, City Yield Modifiers
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_SHALEPLANT',					'YIELD_PRODUCTION',		10;

--------------------------------------------------------------------------------------------------
--Building Tech Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_TechEnhancedYieldChanges (BuildingType,	YieldType,			Yield)
SELECT 'BUILDING_FA_SHALEPLANT',								'YIELD_SCIENCE',	2;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_SCIENCE',			15 UNION ALL
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_GROWTH',			10 UNION ALL
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_PRODUCTION',		60 UNION ALL
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_AIR',				20 UNION ALL
SELECT 'BUILDING_FA_SHALEPLANT',				'FLAVOR_NAVAL',				15;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_JAPAN',											'BUILDINGCLASS_HYDRO_PLANT',	'BUILDING_FA_SHALEPLANT';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
--DELETE FROM Units WHERE Type = 'UNIT_JAPANESE_ZERO';

--------------------------------------------------------------------------------------------------
--Building Resource Production
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity (BuildingType,	ResourceType,		Quantity)
SELECT 'BUILDING_FA_SHALEPLANT',						'RESOURCE_OIL',		1;

--------------------------------------------------------------------------------------------------
--EXPANSION Updates
--------------------------------------------------------------------------------------------------
UPDATE Buildings
	SET Help = 'TXT_KEY_BUILDING_FA_SHALEPLANT2_HELP'
	WHERE EXISTS ( SELECT * FROM UnitCombatInfos WHERE Type = 'UNITCOMBAT_NAVALRANGED')
	AND Type = 'BUILDING_FA_SHALEPLANT';

DELETE FROM Building_YieldChanges
	WHERE EXISTS ( SELECT * FROM UnitCombatInfos WHERE Type = 'UNITCOMBAT_NAVALRANGED')
	AND BuildingType = 'BUILDING_FA_SHALEPLANT';
