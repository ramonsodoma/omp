
{**
 * addCopyeditingUser.tpl
 *
 * Copyright (c) 2003-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Allows editor to add a user who should give feedback about copyedited files.
 *}

<script type="text/javascript">{literal}
	<!--
	$(function() {
		getAutocompleteSource("{/literal}{url op="getCopyeditUserAutocomplete" monographId=$monographId}{literal}", "");
		$("#responseDueDate").datepicker({ dateFormat: 'mm-dd-yy', minDate: '0' });

		// Set response due date to one week in the future
		// FIXME: May want to make a press setting
		var currentTime = new Date();
		var month = currentTime.getMonth() + 1;
		var day = currentTime.getDate() +7;
		var year = currentTime.getFullYear();
		$("#responseDueDate").datepicker('setDate', month + "-" + day + "-" + year);
	});
	// -->
{/literal}</script>

{modal_title id="#addUserContainer" key='editor.monograph.copyediting.addUser' iconClass="fileManagement" canClose=1}

<div id="addUserContainer">
	<form id="addCopyeditingUser" action="{url op="saveAddUser" monographId=$monographId|escape}" method="post">
		<input type="hidden" name="monographId" value="{$monographId|escape}" />

		<!-- User autocomplete -->
		<div id="userAutocomplete">
			{fbvFormSection}
				{fbvElement type="text" id="sourceTitle-" name="copyeditUserAutocomplete" label="user.role.copyeditor" required=true class="required" value=$userNameString|escape }
				<input type="hidden" id="sourceId-" name="userId" class="required" />
			{/fbvFormSection}
		</div>

		<!-- Available copyediting files listbuilder -->
		{url|assign:copyeditingFilesListbuilderUrl router=$smarty.const.ROUTE_COMPONENT component="listbuilder.files.CopyeditingFilesListbuilderHandler" op="fetch" monographId=$monographId}
		{load_url_in_div id="copyeditingFilesListbuilder" url=$copyeditingFilesListbuilderUrl}

		{fbvFormSection}
			{fbvElement type="text" id="responseDueDate" name="responseDueDate" label="editor.responseDueDate" value=$responseDueDate }
		{/fbvFormSection}

		<!-- Message to user -->
		{fbvFormSection}
			{fbvElement type="textarea" name="personalMessage" id="personalMessage" required=true class="required" label="editor.monograph.copyediting.personalMessageTouser" value=$personalMessage measure=$fbvStyles.measure.1OF1 size=$fbvStyles.size.MEDIUM}
		{/fbvFormSection}
	</form>
</div>

{init_button_bar id="#addUserContainer"}

