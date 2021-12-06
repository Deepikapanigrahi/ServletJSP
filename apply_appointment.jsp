<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body bgcolor="wheat">
<br><br><br><br>
<center><h1>Welcome to Patient Home
<br><br><br>
<a href="patient_profile.jsp">Profile</a> |
<a href="apply_appointment.jsp">Apply Appointment</a> |
<a href="view_appointment.jsp">View Appointment</a> |
<a href="index.jsp">Logout</a>

</h1></center>
<br><br><br>
<form action="./patient_appointment.jsp" align="center">
<input type="text" name="name" placeholder="Enter name">
<input type="date" name="date_of_appointment" placeholder="Enter date of appointment">
<input type="text" name="time_of_appointment" placeholder="Enter time">
<input type="text" name="phone" placeholder="Enter phone number">
<input type="text" name="location" placeholder="Enter location">
<input type="text" name="specialist" placeholder="Enter specialist">
<input type="submit" value="Apply">
</form>
</body>
</html>