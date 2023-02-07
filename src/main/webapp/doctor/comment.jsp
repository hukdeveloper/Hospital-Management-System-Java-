<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>

<style type="text/css">
.point-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("../img/doctor2.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white">
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card point-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

						Appointment ap = dao.getAppointmentById(id);
						%>

						<form class="row g-3" action="../updateStatus" method="POST">


							<div class="col-md-6">
								<label>Patient Name</label> <input required type="text"
									value="<%=ap.getFullName()%>" class="form-control">
							</div>


							<div class="col-md-6">
								<label>Age</label> <input required type="number" readonly
									class="form-control" name="age" value="<%=ap.getAge()%>">
							</div>
							<div class="col-md-6">
								<br> <label>Mob No</label> <input required type="text"
									class="form-control" value="<%=ap.getPhNo()%>" readonly>
							</div>
							<div class="col-md-6">
								<br> <label>Diseases</label> <input required type="text"
									readonly value="<%=ap.getDiseases()%>" class="form-control"
									readonly>
							</div>
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required row="3" name="comm" cols=""
									class="form-control"></textarea>
							</div>
							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="did" value="<%=ap.getDoctorId()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>