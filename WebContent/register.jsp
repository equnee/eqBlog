<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.Statement"
	pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta pageEncoding="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    
    <title>注册啰</title>
    <link rel="stylesheet" href="css/log_style.css">
	
	<script type="text/javascript">

            function checkForm(form) {
                if(form.username.value == "") {
                    alert("错误：用户名不能为空！");
                    form.username.focus();
                    return false;
                }
               
                re = /^[A-Za-z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			      if(!re.test(form.mail.value)) {
						alert("错误：邮箱格式错误!");
						form.mail.focus();
						return false;
						}
                
               re = /^\w+$/;
                if(!re.test(form.username.value)) {
                    alert("错误：用户名必须只包含字母、数字和下划线！");
                    form.username.focus();
                    return false;
                }
                
                if(form.username.value.length < 4) {
					alert("错误：用户名不得少于4个字符喔！");
					form.pwd1.focus();
					return false;
				}

				if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
					if(form.pwd1.value.length < 6) {
						alert("错误：密码必须至少包含六个字符！");
						form.pwd1.focus();
						return false;
					}
					
					if(form.pwd1.value.length > 24) {
						alert("错误：密码不得超过24个字符喔");
						form.pwd1.focus();
						return false;
					}
	
	                if(form.pwd1.value == form.username.value) {
						alert("错误：密码必须与用户名不同！");
						form.pwd1.focus();
						return false;
					}
	
	                    re = /[0-9]/;
	
	                if(!re.test(form.pwd1.value)) {
						alert("错误：密码必须包含至少一个数字（0至9）");
						form.pwd1.focus();
						return false;
					}
	
	                    re = /[a-z]/;
					if(!re.test(form.pwd1.value)) {
						alert("错误：密码必须包含至少一个小写字母(a-z)! ");
						form.pwd1.focus();
						return false;
					}
	
	                    re = /[A-Z]/;
						if(!re.test(form.pwd1.value)) {
						alert("错误：密码必须包含至少一个大写字母(A-Z)!");
						form.pwd1.focus();
						return false;
						}

                } else {
					alert("错误：请检查并确认您输入的密码是否一致！");
					form.pwd1.focus();
					return false;
				}
				


              /*   alert("You entered a valid password: " + form.pwd1.value);
                return true; */

                var photo1 = 'image/1.png';
            }

        </script>
	

</head>

  <body style="background-image:url(image/background2.jpg)">
        <div class="login">
      <FORM id="form1" name="form1" METHOD=POST ACTION="register_e.jsp" onsubmit="return checkForm(this);">
            <div class="login-screen">
                <div class="app-title">
                    <h1>register</h1>
                </div>

                <div class="login-form">
				 <div class="control-group">
                        <input type="text" class="login-field" NAME="mail" value="" placeholder="邮箱" id="login-mail" onblur="checkemail()" />
                        <label class="login-field-icon fui-user" for="login-name"></label>
                    </div>

                    <div class="control-group">
                        <input type="text" class="login-field" NAME="username" value="" placeholder="用户名" id="login-name" />
                        <label class="login-field-icon fui-lock" for="login-pass">
                    </div>
                    
                    <div class="control-group">
                        <input type="password" class="login-field" NAME="pwd1" value="" placeholder="密码" id="login-pass" >
                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                    </div>
                    
                    <input type="hidden" name="pho" value="image/1.png"/>
                    
                    <div class="control-group">
                        <input type="password" class="login-field" name="pwd2" value="" placeholder="确认密码" id="login-pass2" >
                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                    </div> 
                   <!--  <div class="control-group">
                        <input type="password" class="login-field" NAME="pawd" value="" placeholder="密保问题" id="login-pass" >
                        <label class="login-field-icon fui-lock" for="login-pass"></label>                    
						<select class="form-control" name="ques">
                              <option value="1">密保问题</option>
                              <option value="2">你的生日</option>
                              <option value="3">你爸爸的生日</option>
                              <option value="4">你妈妈的生日</option>
                              <option value="5">你的爱好</option>
                              <option value="6">你的爱人</option>
                              <option value="7">你的毕业院校</option>
                              <option value="8">你最喜欢的明星</option>
                              <option value="9">你最喜欢的颜色</option>
                              <option value="10">你最喜欢的游戏</option>
                              <option value="11">你最喜欢的电影</option>
                              <option value="12">你最喜欢的食物</option>
                              <option value="13">你最喜欢的运动</option>
                              
                            </select>
                    </div>
                    
                    <div class="control-group" name="anws">
                        <input type="text" class="login-field" NAME="pawd" value="" placeholder="密保答案" id="login-pass" >
                        <label class="login-field-icon fui-lock" for="login-pass"></label>
                    </div> -->
                    
                    <INPUT class="btn btn-primary btn-large btn-block"  TYPE="submit" value="注册 ">
                    <a href="login.html" ><button type="button" class="btn btn-inverse-danger btn-fw">登录</button></a>                  
                </div>
            </div>
            </FORM>
        </div>
    </body>

</html>