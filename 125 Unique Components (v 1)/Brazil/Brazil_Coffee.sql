--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,	BuildingClass,				PrereqTech,			ConquestProb,	Cost,	GoldMaintenance,	BuildingProductionModifier,	SpecialistType,			SpecialistCount,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,					Help,								Strategy,								Civilopedia,							ArtDefineTag,				MinAreaSize) 
SELECT 'BUILDING_FA_COFFEE',	'BUILDINGCLASS_WINDMILL',	'TECH_ECONOMICS',	66,				220,	0,					10,							'SPECIALIST_MERCHANT',	1,					0,					'FA_UB_ATLAS',		1,				'TXT_KEY_BUILDING_FA_COFFEE',	'TXT_KEY_BUILDING_FA_COFFEE_HELP',	'TXT_KEY_BUILDING_WINDMILL_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_WINDMILL_TEXT',	'ART_DEF_BUILDING_FORGE',	-1;

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_COFFEE',						'YIELD_PRODUCTION',		2;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_COFFEE',					'FLAVOR_GROWTH',			10 UNION ALL
SELECT 'BUILDING_FA_COFFEE',					'FLAVOR_PRODUCTION',		20 UNION ALL
SELECT 'BUILDING_FA_COFFEE',					'FLAVOR_GREAT_PEOPLE',		2 UNION ALL
SELECT 'BUILDING_FA_COFFEE',					'FLAVOR_GOLD',				25 UNION ALL
SELECT 'BUILDING_FA_COFFEE',					'FLAVOR_HAPPINESS',			20;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_BRAZIL',											'BUILDINGCLASS_WINDMILL',		'BUILDING_FA_COFFEE';

--------------------------------------------------------------------------------------------------
--Resources
--------------------------------------------------------------------------------------------------
INSERT INTO Resources (Type,	ResourceClassType,		Happiness,	IconAtlas,		PortraitIndex,	ArtDefineTag,				IconString,			Description,					Civilopedia,							Help,									AITradeModifier,	ResourceUsage,	AIObjective,	PlacementOrder,	ConstAppearance,	MinAreaSize,	Player,		Normalize)
SELECT 'RESOURCE_FA_COFFEE',	'RESOURCECLASS_LUXURY',	4,			'FA_UB_ATLAS',	2,				'ART_DEF_RESOURCE_SILK',	'[ICON_UB_COFFEE]',	'TXT_KEY_RESOURCE_FA_COFFEE',	'TXT_KEY_CIV5_RESOURCE_FA_COFFEE_TEXT',	'TXT_KEY_RESOURCE_FA_COFFEE_HELP',		0,					2,				0,				3,				50,					3,				67,			0;

--------------------------------------------------------------------------------------------------
--Resource Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Resource_Flavors (ResourceType,		FlavorType,				Flavor)
SELECT 'RESOURCE_FA_COFFEE',					'FLAVOR_HAPPINESS',		15;

--------------------------------------------------------------------------------------------------
--Font Mapping
-------------------------------------------------------------------------------------------------- 
INSERT INTO IconFontMapping (IconName,	IconFontTexture,			IconMapping)
SELECT 'ICON_UB_COFFEE',				'ICON_FONT_TEXTURE_UB',		1;

--------------------------------------------------------------------------------------------------
--Delete Unique Improvements
--------------------------------------------------------------------------------------------------
--DELETE FROM Improvements WHERE Type = 'IMPROVEMENT_BRAZILWOOD_CAMP';
--DELETE FROM Builds WHERE Type = 'BUILD_BRAZILWOOD_CAMP';

--------------------------------------------------------------------------------------------------
--NON-BNW Updates
--------------------------------------------------------------------------------------------------
--DELETE FROM Buildings
--	WHERE NOT EXISTS ( SELECT * FROM Civilizations WHERE Type = 'CIVILIZATION_BRAZIL')
--	AND Type = 'BUILDING_FA_COFFEE';

--DELETE FROM Resources
--	WHERE NOT EXISTS ( SELECT * FROM Buildings WHERE Type = 'BUILDING_FA_COFFEE')
--	AND Type = 'RESOURCE_FA_COFFEE';

--------------------------------------------------------------------------------------------------
--Building Resource Production
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ResourceQuantity (BuildingType,	ResourceType,				Quantity)
SELECT 'BUILDING_FA_COFFEE',							'RESOURCE_FA_COFFEE',		1;