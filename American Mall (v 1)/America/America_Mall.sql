--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,	BuildingClass,				PrereqTech,				ConquestProb,	Cost,	GoldMaintenance,	Happiness,	SpecialistType,			SpecialistCount,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,				Help,								Strategy,								Civilopedia,							ArtDefineTag,		DisplayPosition,	ArtInfoRandomVariation,	MinAreaSize) 
SELECT 'BUILDING_MALL',		'BUILDINGCLASS_STADIUM',	'TECH_REFRIGERATION',	100,			450,	0,					4,			'SPECIALIST_MERCHANT',	1,					0,					'FA_UB_ATLAS',		0,				'TXT_KEY_BUILDING_MALL',	'TXT_KEY_BUILDING_MALL_HELP',	'TXT_KEY_BUILDING_MALL_STRATEGY',	'TXT_KEY_BUILDING_MALL_TEXT',	'STADIUM',			2,					1,						-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_MALL',									'BUILDINGCLASS_THEATRE';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_MALL',							'YIELD_CULTURE',		2;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_MALL',						'FLAVOR_EXPANSION',			8 UNION ALL
SELECT 'BUILDING_MALL',						'FLAVOR_GROWTH',			8 UNION ALL
SELECT 'BUILDING_MALL',						'FLAVOR_HAPPINESS',			30 UNION ALL
SELECT 'BUILDING_MALL',						'FLAVOR_GOLD',				15 UNION ALL
SELECT 'BUILDING_MALL',						'FLAVOR_CULTURE',			6;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_AMERICA',											'BUILDINGCLASS_STADIUM',		'BUILDING_MALL';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
--DELETE FROM Units WHERE Type = 'UNIT_AMERICAN_B17';

--------------------------------------------------------------------------------------------------
--BNW Updates
--------------------------------------------------------------------------------------------------
UPDATE Buildings
	SET	Help = 'TXT_KEY_BUILDING_MALL_HELP',
		TechEnhancedTourism = 2,
		EnhancedYieldTech = 'TECH_TELECOM'
	WHERE EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN')
	AND Type = 'BUILDING_MALL';

