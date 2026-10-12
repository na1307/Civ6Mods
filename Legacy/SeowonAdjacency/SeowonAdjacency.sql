-- SeowonAdjacency
-- Author: Bluehill
-- DateCreated: 2023-09-13 오후 6:50:15
--------------------------------------------------------------

INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) VALUES ('DISTRICT_SEOWON', 'GBR_Science');
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT 'DISTRICT_SEOWON', 'Pamukkale_Science' AS P WHERE EXISTS (SELECT 1 FROM Adjacency_YieldChanges WHERE ID = P);
INSERT INTO District_Adjacencies (DistrictType, YieldChangeId) SELECT 'DISTRICT_SEOWON', 'LeyLine_Science' AS L WHERE EXISTS (SELECT 1 FROM Adjacency_YieldChanges WHERE ID = L) AND NOT EXISTS (SELECT * FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_SEOWON' AND YieldChangeId = L);
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_MAHAVIHARA' AS M, 'Mahavihara_Seowon_Science_Early' WHERE EXISTS (SELECT 1 FROM Improvements WHERE ImprovementType = M);
INSERT INTO Improvement_Adjacencies (ImprovementType, YieldChangeId) SELECT 'IMPROVEMENT_MAHAVIHARA' AS M, 'Mahavihara_Seowon_Science_Late' WHERE EXISTS (SELECT 1 FROM Improvements WHERE ImprovementType = M);
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict, ObsoleteTech) SELECT 'Mahavihara_Seowon_Science_Early', 'Placeholder', 'YIELD_SCIENCE', '1', '1', 'DISTRICT_SEOWON', 'TECH_SCIENTIFIC_THEORY' WHERE EXISTS (SELECT 1 FROM Improvements WHERE ImprovementType = 'IMPROVEMENT_MAHAVIHARA');
INSERT INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict, PrereqTech) SELECT 'Mahavihara_Seowon_Science_Late', 'Placeholder', 'YIELD_SCIENCE', '2', '1', 'DISTRICT_SEOWON', 'TECH_SCIENTIFIC_THEORY' WHERE EXISTS (SELECT 1 FROM Improvements WHERE ImprovementType = 'IMPROVEMENT_MAHAVIHARA');
