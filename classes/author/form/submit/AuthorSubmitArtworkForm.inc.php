<?php

/**
 * @file classes/author/form/submit/AuthorSubmitArtworkForm.inc.php
 *
 * Copyright (c) 2003-2008 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class AuthorSubmitArtworkForm
 * @ingroup author_form_submit
 *
 * @brief Form for monograph artwork.
 */

// $Id$


import('author.form.submit.AuthorSubmitForm');
import('inserts.artwork.ArtworkInsert');

class AuthorSubmitArtworkForm extends AuthorSubmitForm {

	var $artworkInsert;

	/**
	 * Display the form.
	 */
	function display() {
		$templateMgr =& TemplateManager::getManager();
		$this->artworkInsert->display($this);
		$templateMgr->assign('submission', $this->sequence->monograph);

		parent::display();
	}

	function initializeInserts() {
		$this->artworkInsert = new ArtworkInsert($this->sequence->monograph);
	}

	/**
	 * Initialize form data from current article.
	 */
	function initData() {

	}

	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
		$this->readUserVars($this->artworkInsert->listUserVars());
	}	

	function getTemplateFile() {
		return 'author/submit/artwork.tpl';
	}
	function processEvents() {
		return $this->artworkInsert->processEvents($this);
	}

	/**
	 * Save changes to submission.
	 * @return int the monograph ID
	 */
	function execute() {
		$monographDao =& DAORegistry::getDAO('MonographDAO');

		// Update monograph
		$monograph =& $this->sequence->monograph;
		if ($monograph->getSubmissionProgress() <= $this->sequence->currentStep) {
			$monograph->stampStatusModified();
			$monograph->setSubmissionProgress($this->sequence->currentStep + 1);
		}
		$monographDao->updateMonograph($monograph);
		return $monograph->getMonographId();
	}
}

?>