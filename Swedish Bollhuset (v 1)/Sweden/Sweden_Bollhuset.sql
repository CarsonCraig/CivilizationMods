--------------------------------------------------------------------------------------------------
--Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Buildings (Type,		BuildingClass,				PrereqTech,				CultureRateModifier,	ConquestProb,	Cost,	GoldMaintenance,	Happiness,	HurryCostModifier,	IconAtlas,			PortraitIndex,	Description,						Help,									Strategy,								Civilopedia,						ArtDefineTag,	MinAreaSize) 
SELECT 'BUILDING_FA_BOLLHUSET',		'BUILDINGCLASS_THEATRE',	'TECH_PRINTING_PRESS',	10,						33,				200,	2,					2,			10,					'FA_UB_ATLAS',		17,				'TXT_KEY_BUILDING_FA_BOLLHUSET',	'TXT_KEY_BUILDING_FA_BOLLHUSET_HELP',	'TXT_KEY_BUILDING_THEATRE_STRATEGY',	'TXT_KEY_BUILDING_THEATRE_PEDIA',	'THEATRE',		-1;

--------------------------------------------------------------------------------------------------
--Building Class Reqs
--------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity (BuildingType,		BuildingClassType)
SELECT 'BUILDING_FA_BOLLHUSET',								'BUILDINGCLASS_COLOSSEUM';

--------------------------------------------------------------------------------------------------
--Building Yield Changes
--------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges (BuildingType,	YieldType,				Yield)
SELECT 'BUILDING_FA_BOLLHUSET',						'YIELD_CULTURE',		2;

--------------------------------------------------------------------------------------------------
--Building Flavors
--------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors (BuildingType,		FlavorType,					Flavor)
SELECT 'BUILDING_FA_BOLLHUSET',					'FLAVOR_EXPANSION',			4 UNION ALL
SELECT 'BUILDING_FA_BOLLHUSET',					'FLAVOR_GROWTH',			4 UNION ALL
SELECT 'BUILDING_FA_BOLLHUSET',					'FLAVOR_HAPPINESS',			30 UNION ALL
SELECT 'BUILDING_FA_BOLLHUSET',					'FLAVOR_CULTURE',			40;

--------------------------------------------------------------------------------------------------
--Unique Buildings
--------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides  (CivilizationType,		BuildingClassType,				BuildingType)
SELECT 'CIVILIZATION_SWEDEN',											'BUILDINGCLASS_THEATRE',		'BUILDING_FA_BOLLHUSET';

--------------------------------------------------------------------------------------------------
--Delete Unique Units
--------------------------------------------------------------------------------------------------
--DELETE FROM Units WHERE Type = 'UNIT_SWEDISH_HAKKAPELIITTA';

--------------------------------------------------------------------------------------------------
--BNW Updates
--------------------------------------------------------------------------------------------------
--DELETE FROM Buildings
--	WHERE NOT EXISTS ( SELECT * FROM Civilizations WHERE Type = 'CIVILIZATION_SWEDEN')
--	AND Type = 'BUILDING_FA_BOLLHUSET';

UPDATE Buildings
	SET	Help = 'TXT_KEY_BUILDING_FA_BOLLHUSET2_HELP',
		LandmarksTourismPercent = 25,
		CultureRateModifier = 0
	WHERE EXISTS ( SELECT * FROM Specialists WHERE Type = 'SPECIALIST_MUSICIAN')
	AND Type = 'BUILDING_FA_BOLLHUSET';