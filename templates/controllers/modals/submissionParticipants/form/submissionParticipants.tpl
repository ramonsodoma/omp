{**
 * initiateReviewForm.tpl
 *
 * Copyright (c) 2003-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form used to initiate the first review round.
 * FIXME #5876 -- Enhance when we have a spec for this
 *
 *}
{modal_title id="#submissionParticipants" key='submission.submit.allParticipants' iconClass="fileManagement" canClose=1}
<div id="submissionParticipants">
	<!-- Available submission files -->
	{url|assign:submissionParticipantsGridUrl router=$smarty.const.ROUTE_COMPONENT component="grid.users.submissionParticipant.SubmissionParticipantGridHandler" op="fetchGrid" monographId=$monographId stageId=$monograph->getCurrentStageId() escape=false}
	{load_url_in_div id="submissionParticipantsGrid" url=$submissionParticipantsGridUrl}
</div>

{init_button_bar id="#submissionParticipants"}

