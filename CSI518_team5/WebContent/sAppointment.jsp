<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
           <%@ page import ="java.util.*"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="schoolsystem.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Making a Appointment</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
    margin: 0;
    font-family: 'Playfair Display', serif;
    padding: 0 15px;
}
h1{
  font-size:50px;
  line-height:54px;
  text-align:center;
  margin:100px auto 60px;
  max-width:600px
}

/*Chosen style*/
.chosen-wrapper{
  margin:0 auto 25px;
  max-width:400px;
  position:relative;
  &:after{
    pointer-events: none;
    content: "";
    position: absolute;
    top: 32px;
    right: 20px;
    width: 0;
    height: 0;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-top: 8px solid rgba(0,0,0,.5);
    transition: all .2s cubic-bezier(.25,.46,.45,.94);
    z-index: 9;
  }
  &.is-active{
    &:after{
      border-top: 8px solid rgba(0,0,0,1);
      -ms-transform: rotate(180deg);
      -webkit-transform: rotate(180deg); 
      transform: rotate(180deg);
    }
  }
  .chosen-container{
    .chosen-single{
      border-radius: 0;
      height: 70px;
      border: solid 2px #d9d9d9;
      background:#fff;
      font-size: 22px;
      color: rgba(0,0,0,0.5);
      padding: 0 30px;
      line-height: 66px;
      transition: all 0.3s ease;
      box-shadow:none;
      background:#fff;
      b{
        display:none !important;
      }
      span{
        letter-spacing: 0;
        padding: 0;
        line-height: inherit;
      }
    }
    &.chosen-with-drop{
      .chosen-single{
        border-width: 2px 2px 1px;
        border-color: #000  #000 #d9d9d9;
        color: #000;
        background-image:none;
      }
      .chosen-drop{
        opacity: 1;
        visibility: visible;
        transform: translateY(0);
      }
    }
    &.chosen-container-single-nosearch{
      .chosen-search{
        display:none;
      }
    }
    .chosen-drop{
      letter-spacing: 0;
      border-radius: 0;
      box-shadow: none;
      border-width: 0 2px 2px;
      border-color: #000;
      margin-top:0;
      -webkit-transition: all 0.3s cubic-bezier(0.55, 0.085, 0.68, 0.53);
      -o-transition: all 0.3s cubic-bezier(0.55, 0.085, 0.68, 0.53);
      transition: all 0.3s cubic-bezier(0.55, 0.085, 0.68, 0.53);
      opacity:0;
    }
    .chosen-results{
      font-size: 22px;
      color: #000;
      max-height: 245px;
      margin:0;
      padding:0;
      li{
        padding: 16px 30px 18px;
        margin: 0;
        border-bottom: 1px solid #e5e5e5;
        -webkit-transition: all 0.4s cubic-bezier(0.55, 0.085, 0.68, 0.53);
        -o-transition: all 0.4s cubic-bezier(0.55, 0.085, 0.68, 0.53);
        transition: all 0.4s cubic-bezier(0.55, 0.085, 0.68, 0.53);
        line-height:20px;
        &.highlighted {
          background-color: #eeeeee !important;
          color: #000;
          background-image:none;
        }
      }
    }
  }
  &--style2{
    &:after{
      right:0;
    }
    &:before{
      content:'';
      width:0;
      border-top:2px solid #000;
      position:absolute;
      left:0;
      bottom:0;
      z-index:1;
      transition: all 0.2s cubic-bezier(.06,1,.89,.85);
    }
    &.is-active{
      &:before{
        width:100%;
      }
    }
    .chosen-container{
      .chosen-single{
        border-width:0 0 2px;
        padding:0;
      }
      &.chosen-with-drop{
        .chosen-single{
          border-width: 0 0 2px;
        }
        .chosen-drop{
          opacity: 1;
          visibility: visible;
          transform: translateY(5px);
        }
      }
      .chosen-drop{
        border-color:#d9d9d9;
        border-top: 2px solid #d9d9d9;
      }
      .chosen-results{
        li{
          padding: 16px 15px 18px;
        }
      }
    }
  }
}


/*ScrollBox style*/
.nicescroll-rails{
  border-left: 1px solid #d9d9d9;
  transform: translate(-2px);
  top:0 !important;
  .nicescroll-cursors{
    width:6px !important;
    margin-right:2px;
  }
}

.link{
  position:absolute;
  left:0;
  bottom:0;
  padding:20px;
  a{
      display:flex;
      align-items:center;
      text-decoration:none;
      color:#000;
  }
  .fa{
    font-size:28px;
    margin-right:8px;
    color:#000;
  }
}
#grad1 {
  height: 200px;
  background-image: linear-gradient(to right, rgba(0,0,0,1), rgba(255,255,255,1)); /* Standard syntax (must be last) */
}

</style>
</head>
<%
	List<Map> list =new ArrayList<Map>();
	ResultSet rs = DatabaseAccess.getInstructors();
	try {
		
		System.out.println("getInstructors");
		while (rs.next()) {
			String fname = rs.getString("firstname");
			String lname = rs.getString("lastname");
			int userid = rs.getInt("iduser");
			//System.out.println("Teachername: " + fname + lname);
		
			
			
			Map map = new HashMap<>(); 
			map.put("firstname", fname);			
			map.put("lastname", lname);	
			map.put("userid", userid);
			//map.put("content", content);
			
			System.out.println(map);
			list.add(map);
			
			for (@SuppressWarnings("rawtypes") Map map_1 :list) {
				System.out.println(map_1);
			}
			
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	request.setAttribute("key_list",list);
	
	List<Map> time = new ArrayList<Map>();
	String nine = "9:00";
	String eight = "8:00";
	Map timemap = new HashMap<>();
	timemap.put("nine", nine);
	timemap.put("eight", eight);
	time.add(timemap);
	
	List<Map> date = new ArrayList<Map>();
	Map datemap = new HashMap<>();
	datemap.put("Monday", "Monday");
	datemap.put("Tuesday","Tuesday");
	datemap.put("Wednesday","Wednesday");
	datemap.put("Thursday", "Thursday");
	datemap.put("Friday", "Friday");
	date.add(datemap);
	
	request.setAttribute("time", time);
	request.setAttribute("date", date);
%>
<body id="grad1">
	<script>
function myFunction() {
    alert("Success!");
}
</script>
<h1 style="color:white">Please choose a Instructor below</h1>

	<form  class="form-horizontal" action="/CSI518_team5/Appointment" method="post" onsubmit="myFunction()">
	<div  data-js="custom-scroll" style="font-size:25px; color:red">
		Instructor:<select class="chosen-select" name="teachername" class="form-control" style="    width: 200px;
    height: 40px;
    font-size: 25px;">
		<c:forEach items="${key_list}" var="apt">
			
        	<option id="${apt.userid}" value = "${apt.userid}">${apt.firstname}</option>
			
		</c:forEach>
		</select>
</div>
<div style="font-size:25px;color:red">
		Time:<select class="time" name="time" class="form-control" style="    width: 200px;
    height: 40px;
    font-size: 25px;">
		<c:forEach items="${time}" var="time">
			
        	<option id= "${time.eight}" value="${time.eight}">8:00</option>
        	<option id= "${time.nine}" value="${time.nine}">9:00</option>
			
		</c:forEach>
		</select>
		Date:<select class="date" name="date" class="form-control" style="    width: 200px;
    height: 40px;
    font-size: 25px;">
		<c:forEach items="${date}" var="date">
			
        	<option id= "${date.Monday}" value="${date.Monday}">Monday</option>
        	<option id= "${date.Tuesday}" value="${date.Tuesday}">Tuesday</option>
        	<option id= "${date.Wednesday}" value="${date.Wednesday}">Wednesday</option>
        	<option id= "${date.Thursday}" value="${date.Thursday}">Thursday</option>
        	<option id= "${date.Friday}" value="${date.Friday}">Friday</option>
			
		</c:forEach>
		</select>
		<input type="submit" class="btn btn-primary" value="submit"  style="    width: 150px;
										     
    height: 40px;
    font-size: 25px;"><a href="index.jsp">Back</a>
		</div>
	</form>
	
</body>
</html>
