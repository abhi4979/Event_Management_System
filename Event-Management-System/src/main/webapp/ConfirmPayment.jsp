<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Payment Confirmation</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #87CEFA;
            padding: 10px 20px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            padding: 8px 16px;
            font-size: 16px;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        .navbar .logo {
            font-size: 24px;
            font-weight: bold;
            color: black;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .navbar .logo-highlight {
            color: #ffc107; 
        }
       .navbar .icons a{
             font-size: 20px;
             color:black;
             margin-right: 20px;
       }
        .container {
            text-align: center;
            margin-top: 80px;
        }

        .success-checkmark {
            width: 80px;
            height: 80px;
            margin: 0 auto;
            margin-bottom: 20px;
            position: relative;
        }

        .success-checkmark .check-icon {
            width: 80px;
            height: 80px;
            position: absolute;
            background: #ffffff;
            border-radius: 50%;
            display: block;
            stroke-width: 2px;
            stroke: #4CAF50;
            stroke-miterlimit: 10;
            box-shadow: inset 0px 0px 0px #4CAF50;
            animation: fill 0.4s ease-in-out 0.4s forwards, scale 0.3s ease-in-out 0.9s both;
        }

        .success-checkmark .check-icon:before {
            width: 30px;
            height: 60px;
            position: absolute;
            content: '';
            background-color: #ffffff;
            display: block;
            top: 14px;
            left: 26px;
            border-radius: 10px;
            transform: rotate(-45deg);
            animation: rotate-line 0.4s ease-in-out 0.9s both;
        }

        .success-message {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }

        .exit-btn {
            background-color: #333;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            font-size: 16px;
        }

        .exit-btn:hover {
            background-color: #555;
        }

        @keyframes fill {
            0% {
                box-shadow: inset 0px 0px 0px #4CAF50;
            }
            100% {
                box-shadow: inset 0px 0px 50px #4CAF50;
            }
        }

        @keyframes scale {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(0);
            }
        }

        @keyframes rotate-line {
            0% {
                transform: rotate(-45deg) scaleX(0);
            }
            50% {
                transform: rotate(-45deg) scaleX(1);
            }
            100% {
                transform: rotate(-45deg) scaleX(1);
            }
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="logo-container">
        <span class="logo">Event<span class="logo-highlight">ify</span></span>
    </div>
    <div class="icons">
        <a href="showuseroption">Back to Menu</a>
       <a href="userlogout"><i class="fas fa-sign-out-alt" style="color:black;"></i></a>
    </div>
</div>

<div class="container">
    <div class="success-checkmark">
        <div class="check-icon"></div>
    </div>
    <div class="success-message">
        Payment Successful!
    </div>
    <button class="exit-btn" onclick="window.location.href='HomeProject.jsp'">Exit</button>
</div>
</body>
</html>
