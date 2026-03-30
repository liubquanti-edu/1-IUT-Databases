SELECT p.Name AS Medecin
FROM Department d
JOIN Physician p ON p.EmployeeID = d.Head;

SELECT r.BlockCode, r.BlockFloor
FROM Room r
WHERE r.RoomNumber = 212;

SELECT COUNT(*) AS NombreChambresDisponibles
FROM Room r
WHERE r.Unavailable = 0;

SELECT DISTINCT p.Name AS Patient
FROM Patient p
JOIN Appointment a ON a.Patient = p.SSN;

SELECT p.Name AS Patient, COUNT(a.AppointmentID) AS NombreRendezVous
FROM Patient p
LEFT JOIN Appointment a ON a.Patient = p.SSN
GROUP BY p.SSN, p.Name;

SELECT p.Name AS Patient, COUNT(DISTINCT a.Physician) AS NombreMedecinsDifferents
FROM Patient p
LEFT JOIN Appointment a ON a.Patient = p.SSN
GROUP BY p.SSN, p.Name;

SELECT COUNT(DISTINCT a.Patient) AS NombrePatientsDistincts
FROM Appointment a
WHERE a.ExaminationRoom IS NOT NULL;

SELECT DISTINCT p.Name AS Patient, ph.Name AS Medecin
FROM Appointment a
JOIN Patient p ON p.SSN = a.Patient
JOIN Physician ph ON ph.EmployeeID = a.Physician;

SELECT DISTINCT p.Name AS Patient, s.Room AS Salle
FROM Undergoes u
JOIN Patient p ON p.SSN = u.Patient
JOIN Stay s ON s.StayID = u.Stay;

SELECT p.Name AS Patient, ph.Name AS Medecin, m.Name AS Medicament
FROM Prescribes pr
JOIN Patient p ON p.SSN = pr.Patient
JOIN Physician ph ON ph.EmployeeID = pr.Physician
JOIN Medication m ON m.Code = pr.Medication;

SELECT p.Name AS Patient, COUNT(DISTINCT pr.Medication) AS NombreMedicamentsDifferents
FROM Patient p
LEFT JOIN Prescribes pr ON pr.Patient = p.SSN
GROUP BY p.SSN, p.Name;

WITH AppointmentsPerPatient AS (
	SELECT a.Patient, COUNT(*) AS NbRendezVous
	FROM Appointment a
	GROUP BY a.Patient
)
SELECT p.Name AS Patient, app.NbRendezVous
FROM AppointmentsPerPatient app
JOIN Patient p ON p.SSN = app.Patient
WHERE app.NbRendezVous = (
	SELECT MAX(NbRendezVous)
	FROM AppointmentsPerPatient
);