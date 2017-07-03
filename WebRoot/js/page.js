var mainPage = {
		showLeftMenu:function(menuId,img){
			$('#'+menuId).animate({marginLeft:"0px",queue:true});
			$(img).addClass("closed");
			$(img).attr("title",'隐藏左侧菜单');
			var submenus_width = $("#left_submenus").width() + 15;
			$(img).css({"margin-left":submenus_width});
			$(img).css({"transform":"rotate(90deg)",
								   "-ms-transform":"rotate(180deg)",
								   "-moz-transform":"rotate(180deg)",
								   "-webkit-transform":"rotate(180deg)",
								   "-o-transform":"rotate(180deg)"});
		},
		hideLeftMenu:function(menuId,img){
			var submenus_width = $("#left_submenus").width() + 15;
			$('#'+menuId).animate({marginLeft: -submenus_width,queue:true});
			$(img).removeClass("closed");
			$(img).attr("title",'显示左侧菜单');
			$(img).css({"margin-left":'10px'});
			$(img).css({"transform":"rotate(0deg)",
				   "-ms-transform":"rotate(0deg)",
				   "-moz-transform":"rotate(0deg)",
				   "-webkit-transform":"rotate(0deg)",
				   "-o-transform":"rotate(0deg)"});
		},
		loadMainMenu:function(jsonurl,ul){
			$.get(jsonurl, function (data) {
				var menus = data.menus;
				var str = "";
				if(menus && menus.length>0){
					mainPage.menus = menus;
					for(var i=0;i<menus.length;i++){
						var menu = menus[i];
						var link = menu.link;
						if(link && link.length>0){
							str = str + "<li><a onclick='mainPage.clickMainMenu(this)' link='" + link + "' linkid='" + menu.id + "'>" + menu.text + "</a></li>";
						}else{
							str = str + "<li><a onclick='mainPage.clickMainMenu(this)' linkid='" + menu.id + "' nav='" + menu.text + "'>" + menu.text + "</a></li>";
						}
					}
				}
				ul.html(str);
				var links = $("#mainMenu").find("a");
				$(links[0]).click();
			});
		},
		clickMainMenu:function(alink){
			$(".linked").removeClass("linked");
			var linkid = $(alink).attr('linkid');
			$(alink).addClass("linked");
			var menus = mainPage.menus;
			for(var i=0;i<menus.length;i++){
				var mmenu = menus[i];
				var link_id = mmenu.id;
				if(link_id==linkid){
					var submenus = mmenu['submenus'];
					var nowMenu;
					if(submenus && submenus.length>0){
						var str = '';
						for(var j=0;j<submenus.length;j++){
							var submenu = submenus[j];
							var link = submenu.link;
							var ssubmenus = submenu['submenus'];
							if(ssubmenus && ssubmenus.length>0){
								str = str + "<li><a link='"+link+"' linkid='"+submenu.id+"' class='dropdown-toggle' data-toggle='dropdown' href='#'>" + submenu.text + "<span class='caret'></span></a>";
								var substr = naviMenus(ssubmenus);
								str = str + substr + '</li>';
							}else{
								str = str + "<li><a link='"+link+"' linkid='"+submenu.id+"' onclick='mainPage.clickSubMenu(this)' target='contentframe'>" + submenu.text + "</a></li>";
							}
						}
						$("#left_submenus").html(str);
						var submenus_width = $("#left_submenus").width();
						$("#left_submenus .submenu").css({marginLeft:submenus_width});
						$("#leftmenu_img").show();
						mainPage.showLeftMenu("sidebar-left","#leftmenu_img");
						var nowMenus = submenus[0];//现在默认显示三层，先获取第三层菜单的第一个，以后如果没有限制了，根据数据多层的话，要获取最叶子节点的数据
						var nowMenu;
						if(nowMenus && nowMenus.length>0){
							nowMenu = nowMenus[0];
						}else{
							nowMenu = nowMenus;
						}
					}else{
						$("#left_submenus").html('');
						mainPage.hideLeftMenu("sidebar-left","#leftmenu_img");
						$("#leftmenu_img").hide();
						nowMenu = mmenu;
					}
					var link = nowMenu.link;
					$("#contentframe").attr('src',link);	//更新iframe链接
					$("#navi_link").html('<li><a href="#" target="contentframe">首页</a></li><li class="active"><a href="'+link+'" target="contentframe">'+nowMenu.text+'</a></li>');
				}
			}
		},
		clickSubMenu:function(alink){
			var jq_link = $(alink);
			var link = jq_link.attr('link');
			var link_id = jq_link.attr('linkid');
			if(link && link.length>0){
				$("#contentframe").attr('src',link);
				//遍历菜单JSON获取导航字符串
				var menus = mainPage.menus;
				var nav_str = '';
				for(var i=0;i<menus.length;i++){
					nav_str = '<li><a href="#" target="contentframe">首页</a></li>';
					var menu = menus[i];
					var link = menu.link;
					var id = menu.id;
					var text = menu.text;
					nav_str = nav_str + '<li><a href="javascript:void(0);">'+text+'</a></li>';
					if(link_id==id){
						break;
					}else{
						var submenus = menu.submenus;
						if(submenus && submenus.length>0){
							rst = naviSubmenus(submenus,nav_str,link_id);
							var exist = rst[0];
							if(exist){
								nav_str = rst[1];
								break;
							}else{
								nav_str = '';
							}
						}
					}
				}
				$("#navi_link").html(nav_str);
			}else{
				return false;
			}
		}
};

/**
 * 拼接导航菜单
 * @param submenus
 * @param nav_str
 * @returns
 */
function naviSubmenus(submenus,nav_str,link_id){
	var exist = false;  //是否找到对应的菜单
	var temp_nav_str = '';
	for(var j=0;j<submenus.length;j++){
		var submenu = submenus[j];
		var sub_link = submenu.link;
		var sub_text = submenu.text;
		var sub_id = submenu.id;
		temp_nav_str = temp_nav_str + '<li><a href="javascript:void(0);">'+sub_text+'</a></li>';
		if(link_id==sub_id){
			exist = true;
			break;
		}else{
			var ssubmenus = submenu.submenus;
			if(ssubmenus && ssubmenus.length>0){
				rst = naviSubmenus(ssubmenus,temp_nav_str,link_id);
				var exist = rst[0];
				if(exist){
					temp_nav_str = rst[1];
					break;
				}else{
					temp_nav_str = '';
				}
			}else{
				temp_nav_str = '';
			}
		}
	}
	nav_str = nav_str + temp_nav_str;
	var rst = [exist,nav_str];
	return rst;
}

/**
 * 迭代子菜单
 * @param submenus
 * @returns {String}
 */
function naviMenus(submenus){
	var substr = '<ul class="dropdown-menu submenu">';
	for(var m=0;m<submenus.length;m++){
		var sub_menu = submenus[m];
		substr = substr + '<li><a link="' + sub_menu.link + '" linkid="' + sub_menu.id + '" onclick="mainPage.clickSubMenu(this)" target="contentframe">' + sub_menu.text + '</a>';
		var ssubmenus = sub_menu.submenus;
		/*if(ssubmenus && ssubmenus.length>0){//目前只显示三层菜单，如果继续显示，放开下面的注释，修改样式，现在显示不出来
			var ssubstr = naviMenus(ssubmenus);
			substr = substr + ssubstr;
		}*/
		substr = substr + "</li>";
	}
	substr = substr + '</ul>';
	return substr;
}

$(function(){
	//加载菜单
	mainPage.loadMainMenu('../js/menus.json', $("#mainMenu"));
	
	$("#leftmenu_img").click(function(){
		var close = $(this).hasClass("closed");
		if(close){
			mainPage.hideLeftMenu("sidebar-left",this);
		}else{
			mainPage.showLeftMenu("sidebar-left",this);
		}
	});
	
	iFrameHeight();
});

/**
 * 初始化iframe的高度
 */
function iFrameHeight() {  
	var bh = $(document).height();				//浏览器当前窗口文档的高度
	var div_top = $("#iframeset").offset().top;	//iframe所在父元素距离浏览器可是范围顶部的距离
	var ban_hi = $("#linknaver").height();		//iframe同级子元素距离浏览器可是范围顶部的距离
	var rst = bh - div_top - ban_hi - 5;
	$("#contentframe").css("height",rst);
}   