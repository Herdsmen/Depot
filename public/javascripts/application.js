// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
window.onload=function(){
	var dl=$$("#recommend dl");
	if(dl.length<1) return false;
	for(var i=0;i<dl.length;i++){
		//初始化，让第一个类为over
		if(dl[i].className.indexOf("over")==-1){
			dl[0].className="over";
		}
		//遍历循环，模拟:hover伪类
		dl[i].onmouseover=function(){
			for(var j=0;j<dl.length;j++){
				dl[j].className="";
			}
			this.className="over";
		}
	}
}