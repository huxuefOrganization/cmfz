<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>持名法州主页</title>
		<link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../themes/icon.css">
		<link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="../js/datagrid-detailview.js"></script>
		<script type="text/javascript" src="../js/wangEditor.js"></script>
		<script type="text/javascript" src="../js/echarts.min.js"></script>
		<script type="text/javascript" src="../js/china.js"></script>
		<script type="text/javascript">
			// 页面加载
			$(function () {
				// 发送ajax请求查询所有菜单
				$.post(
				    "${pageContext.request.contextPath}/main/showAllMenu",
					function (result) {
						// 遍历菜单
						$.each(result,function (index,menu) {
						    // 遍历二级菜单
                            var content = "<div style='text-align: center;'>";
							$.each(menu.childMenu,function (index,child) {
								var json = JSON.stringify(child);
								content += "<div onclick='addTabs("+json+")' class='easyui-linkbutton' data-options=\"iconCls:'"+child.icon+"',plain:true,\" style='border:1px solid;width:90%;margin:5px 0px 5px 0px;'>"+child.name+"</div><br/>";
                            });
                            content += "</div>"
						    // 渲染一级菜单
							$("#aa").accordion('add',{
							    title:menu.name,
                                iconCls:menu.icon,
                                content:content,
							});
                        })
                    }
				);
            });

			// 点击链接添加选项卡
			function addTabs(child) {
			    if(!$("#tabs").tabs('exists',child.name)){
                    $("#tabs").tabs('add',{
                        title:child.name,
                        closable:true,
                        iconCls:child.icon,
                        href:'${pageContext.request.contextPath}/'+child.href,
                        fit:true,
                    })
				}else{
                    $("#tabs").tabs('select',child.name);
                }
            }


		</script>

	</head>
<body class="easyui-layout">   
    <div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.manager.name} &nbsp;
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 gaozhy@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">
    		
		</div>  
    </div>   
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
			<%--引入主体部分--%>
		    <div id="tabs" class="easyui-tabs" title="主页" data-options="iconCls:'icon-neighbourhood',fit:true,"
				 style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>

    </div>   
</body> 
</html>