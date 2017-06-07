  function getDateTime(date,fomat){
	 
	 var myDate = new Date(date);
	 myDate.getYear();        //获取当前年份(2位)
	 myDate.getFullYear();    //获取完整的年份(4位,1970-????)
	 myDate.getMonth();       //获取当前月份(0-11,0代表1月)
	 myDate.getDate();        //获取当前日(1-31)
	 myDate.getDay();         //获取当前星期X(0-6,0代表星期天)
	 myDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
	 myDate.getHours();       //获取当前小时数(0-23)
	 myDate.getMinutes();     //获取当前分钟数(0-59)
	 myDate.getSeconds();     //获取当前秒数(0-59)
	 myDate.getMilliseconds();    //获取当前毫秒数(0-999)
	 myDate.toLocaleDateString();     //获取当前日期
	 var mytime=myDate.toLocaleTimeString();     //获取当前时间
	 myDate.toLocaleString( );        //获取日期与时间
	 if(fomat=='yyyy-MM-dd HH:mm:ss'){
		 var s = myDate.getMilliseconds();
		 if(s<10){
			 s+='0'+s;
		 }
		 return myDate.getFullYear()+"-"+ (myDate.getMonth()+1)+"-"+myDate.getDate()+" "
		 +myDate.getHours()+":"+ myDate.getMinutes()+":"+s;
		 
	 }
	 if(fomat=='yyyy/MM/dd'){
		 return myDate.getFullYear()+"/"+ (myDate.getMonth()+1)+"/"+myDate.getDate();
	 }
	 if(fomat=='HH:mm:ss'){
		 return myDate.getHours()+":"+ myDate.getMinutes()+":"+myDate.getMilliseconds();
	 }
	 if(fomat=='h：m：s'){
		 return myDate.getHours()+":"+ myDate.getMinutes()+":"+myDate.getMilliseconds();
	 }
	 if(fomat=='mm-dd hh:mm:ss'){
		 return  (myDate.getMonth()+1) +"月"+ myDate.getDate()+"日 "+ myDate.getHours()+""+ myDate.getMinutes()+":"+myDate.getMilliseconds();
	 }
	 if(fomat=='HHmmssSSS'){
		 return myDate.getHours()+ myDate.getMinutes()+myDate.getMilliseconds()+myDate.getMilliseconds()+"";
	 }
	 if(fomat=='HHmmss'){
		 return myDate.getHours()+ myDate.getMinutes()+myDate.getMilliseconds()+"";
	 }
	 return (myDate.getMonth()+1) +"-"+ myDate.getDate()+" "+ myDate.getHours()+""+ myDate.getMinutes()+":"+myDate.getMilliseconds();
 }
	 