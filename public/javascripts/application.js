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

function classChangeNum(textBoxId)
{
    var step = 1; 
    var changeStepTimer = null; 
	var setValueTimer = null; 
	/*改变速度私有方法*/
    var changeStep = function()
    {
		changeStepTimer = setInterval(function(){step += 1}, 1000);//每隔1秒速度加5
    }
	/*设置值私有方法*/
	var setValueIncrease = function()
    {
        var textValue = parseInt($(textBoxId).value);
        if((textValue + step) < 100)
        	$(textBoxId).value = textValue + step;
        else
        	$(textBoxId).value = 99;
		setValueTimer = setTimeout(setValueIncrease,200); //每隔200毫秒更数文本框数值一次
    }
	var setValueDecrease = function()
    {
        var textValue = parseInt($(textBoxId).value);
        if((textValue - step) > 0)
        	$(textBoxId).value = textValue - step;
        else
        	$(textBoxId).value = 1;
		setValueTimer = setTimeout(setValueDecrease,200); //每隔200毫秒更数文本框数值一次
    }
	/*按下鼠标处理函数*/
    this.UP = function()
    {
        changeStep();
		setValueIncrease();
    }
	this.DOWN = function()
    {
        changeStep();
		setValueDecrease();
    }
	/*松开鼠标处理函数*/
    this.mouseUpHandle = function()
    {
		clearInterval(changeStepTimer);//停止变速和改变文本框的值
		clearTimeout(setValueTimer);
		step = 1; //恢复默认速度
    }
}