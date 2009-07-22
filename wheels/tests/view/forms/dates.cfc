<cfcomponent extends="wheels.test">

	<cffunction name="_setup">
		<cfset global = {}>
		<cfset global.controller = createobject("component", "wheels.tests.ControllerWithModel")>
		<cfset global.model = createobject("component", "wheels.tests.ModelUsers")>
		<cfset global.args= {}>
		<cfset global.args.objectName = "ModelUsers1">
	</cffunction>

	<cffunction name="setup">
		<cfset loc = {}>
		<cfset loc.a = duplicate(global.args)>
	</cffunction>

	<cffunction name="test_dateselect_parsing_and_passed_month">
		<cfset loc.a.property = "birthday">
		<cfset loc.a.order = "month">
		<cfset halt(false, "global.controller.dateSelect(argumentcollection=loc.a)")>
		<cfset loc.e = dateSelect_month_str(loc.a.property)>
		<cfset loc.r = global.controller.dateSelect(argumentcollection=loc.a)>
		<cfset assert("loc.e eq loc.r")>
		<cfset loc.a.property = "birthdaymonth">
		<cfset loc.e = dateSelect_month_str(loc.a.property)>
		<cfset loc.r = global.controller.dateSelect(argumentcollection=loc.a)>
		<cfset assert("loc.e eq loc.r")>
	</cffunction>

	<cffunction name="dateSelect_month_str">
		<cfargument name="property" type="string" required="true">
		<cfreturn '<select name="ModelUsers1[#arguments.property#]($month)" id="ModelUsers1-#arguments.property#-month"><option value="1">January</option><option value="2">February</option><option value="3">March</option><option value="4">April</option><option value="5">May</option><option value="6">June</option><option value="7">July</option><option value="8">August</option><option value="9">September</option><option value="10">October</option><option value="11" selected="selected">November</option><option value="12">December</option></select>'>
	</cffunction>

	<cffunction name="test_dateselect_parsing_and_passed_year">
		<cfset loc.a.property = "birthday">
		<cfset loc.a.order = "year">
		<cfset loc.a.startyear = "1973">
		<cfset loc.a.endyear = "1976">
		<cfset halt(false, "global.controller.dateSelect(argumentcollection=loc.a)")>
		<cfset loc.e = dateSelect_year_str(loc.a.property)>
		<cfset loc.r = global.controller.dateSelect(argumentcollection=loc.a)>
		<cfset assert("loc.e eq loc.r")>
		<cfset loc.a.property = "birthdayyear">
		<cfset loc.e = dateSelect_year_str(loc.a.property)>
		<cfset loc.r = global.controller.dateSelect(argumentcollection=loc.a)>
		<cfset assert("loc.e eq loc.r")>
	</cffunction>

	<cffunction name="test_dateselect_year_is_less_than_startyear">
		<cfset loc.a.property = "birthday">
		<cfset loc.a.order = "year">
		<cfset loc.a.startyear = "1976">
		<cfset loc.a.endyear = "1980">
		<cfset halt(false, "global.controller.dateSelect(argumentcollection=loc.a)")>
		<cfset loc.e = '<select name="ModelUsers1[birthday]($year)" id="ModelUsers1-birthday-year"><option value="1975" selected="selected">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option></select>'>
		<cfset loc.r = global.controller.dateSelect(argumentcollection=loc.a)>
		<cfset assert("loc.e eq loc.r")>
	</cffunction>

	<cffunction name="dateSelect_year_str">
		<cfargument name="property" type="string" required="true">
		<cfreturn '<select name="ModelUsers1[#arguments.property#]($year)" id="ModelUsers1-#arguments.property#-year"><option value="1973">1973</option><option value="1974">1974</option><option value="1975" selected="selected">1975</option><option value="1976">1976</option></select>'>
	</cffunction>





</cfcomponent>