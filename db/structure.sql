CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pagename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seqnum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beizhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `book_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `clicks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clicks` int(11) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `course_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_date` datetime DEFAULT NULL,
  `course_num` int(11) DEFAULT NULL,
  `action_type` int(11) DEFAULT NULL,
  `lesson_id` int(11) DEFAULT NULL,
  `teaching_material_id` int(11) DEFAULT NULL,
  `spm_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `dairy_plan_id` int(11) DEFAULT NULL,
  `word_material_id` int(11) DEFAULT NULL,
  `word_counts` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `dairy_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_date` datetime DEFAULT NULL,
  `spm_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plantype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `exam_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `finish_time` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `set_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ext_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `total_class_count` int(11) DEFAULT NULL,
  `listen_course_count` int(11) DEFAULT NULL,
  `read_course_count` int(11) DEFAULT NULL,
  `write_course_count` int(11) DEFAULT NULL,
  `speak_course_count` int(11) DEFAULT NULL,
  `completion_course_count` int(11) DEFAULT NULL,
  `syntax_course_count` int(11) DEFAULT NULL,
  `listen_teacher_id` int(11) DEFAULT NULL,
  `read_teacher_id` int(11) DEFAULT NULL,
  `write_teacher_id` int(11) DEFAULT NULL,
  `speak_teacher_id` int(11) DEFAULT NULL,
  `completion_teacher_id` int(11) DEFAULT NULL,
  `syntax_teacher_id` int(11) DEFAULT NULL,
  `listen_goal_score` int(11) DEFAULT NULL,
  `read_goal_score` int(11) DEFAULT NULL,
  `write_goal_score` int(11) DEFAULT NULL,
  `speak_goal_score` int(11) DEFAULT NULL,
  `completion_goal_score` int(11) DEFAULT NULL,
  `syntax_goal_score` int(11) DEFAULT NULL,
  `total_goal_score` int(11) DEFAULT NULL,
  `last_exam_score` int(11) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_tel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `consuming_time` int(11) DEFAULT NULL,
  `teaching_material_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `wordcounts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `meanings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_confirmed` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `paper_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `word_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_type_id` int(11) DEFAULT NULL,
  `is_before` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `start_word` int(11) DEFAULT NULL,
  `end_word` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `result_papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paper_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `result_words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) DEFAULT NULL,
  `result_paper_id` int(11) DEFAULT NULL,
  `is_right` int(11) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `words_score1` int(11) DEFAULT NULL,
  `words_score2` int(11) DEFAULT NULL,
  `words_score3` int(11) DEFAULT NULL,
  `words_score4` int(11) DEFAULT NULL,
  `listen_score1` int(11) DEFAULT NULL,
  `listen_words_score1` int(11) DEFAULT NULL,
  `write_score1` int(11) DEFAULT NULL,
  `write_words_score1` int(11) DEFAULT NULL,
  `read_score1` int(11) DEFAULT NULL,
  `read_words_score1` int(11) DEFAULT NULL,
  `spoken_score1` int(11) DEFAULT NULL,
  `spoken_words_score1` int(11) DEFAULT NULL,
  `result_date` datetime DEFAULT NULL,
  `jpm_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `exception_type` int(11) DEFAULT NULL,
  `has_exception` int(11) DEFAULT NULL,
  `exception_handle` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `student_timelines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arrival_time` datetime DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `action_type_1` int(11) DEFAULT NULL,
  `action_spec_1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type_1` int(11) DEFAULT NULL,
  `action_type_2` int(11) DEFAULT NULL,
  `action_spec_2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type_2` int(11) DEFAULT NULL,
  `action_type_3` int(11) DEFAULT NULL,
  `action_spec_3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type_3` int(11) DEFAULT NULL,
  `action_type_4` int(11) DEFAULT NULL,
  `action_spec_4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type_4` int(11) DEFAULT NULL,
  `action_type_5` int(11) DEFAULT NULL,
  `action_spec_5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type_5` int(11) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `jpm_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `teaching_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `teaching_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `sloved` tinyint(1) DEFAULT '0',
  `slove_spec` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_spec` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `problem_type` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `role` mediumint(9) DEFAULT '0',
  `jpm_id` int(11) DEFAULT NULL,
  `spm_id` int(11) DEFAULT NULL,
  `is_activity` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `word_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `book_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `word_meanings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) DEFAULT NULL,
  `meaning_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `word_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_property_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonogram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `affix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `root` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20120308031928');

INSERT INTO schema_migrations (version) VALUES ('20120308034404');

INSERT INTO schema_migrations (version) VALUES ('20120410025619');

INSERT INTO schema_migrations (version) VALUES ('20120410053811');

INSERT INTO schema_migrations (version) VALUES ('20120413095208');

INSERT INTO schema_migrations (version) VALUES ('20120416025854');

INSERT INTO schema_migrations (version) VALUES ('20120418040553');

INSERT INTO schema_migrations (version) VALUES ('20120420040831');

INSERT INTO schema_migrations (version) VALUES ('20120420101601');

INSERT INTO schema_migrations (version) VALUES ('20120423064151');

INSERT INTO schema_migrations (version) VALUES ('20120423081120');

INSERT INTO schema_migrations (version) VALUES ('20120423084745');

INSERT INTO schema_migrations (version) VALUES ('20120424071239');

INSERT INTO schema_migrations (version) VALUES ('20120424073922');

INSERT INTO schema_migrations (version) VALUES ('20120425075603');

INSERT INTO schema_migrations (version) VALUES ('20120503035256');

INSERT INTO schema_migrations (version) VALUES ('20120504071142');

INSERT INTO schema_migrations (version) VALUES ('20120504105317');

INSERT INTO schema_migrations (version) VALUES ('20120511100024');

INSERT INTO schema_migrations (version) VALUES ('20120514103005');

INSERT INTO schema_migrations (version) VALUES ('20120518092920');

INSERT INTO schema_migrations (version) VALUES ('20120521083336');

INSERT INTO schema_migrations (version) VALUES ('20120730070707');

INSERT INTO schema_migrations (version) VALUES ('20120730070733');

INSERT INTO schema_migrations (version) VALUES ('20120730071821');

INSERT INTO schema_migrations (version) VALUES ('20120730072036');

INSERT INTO schema_migrations (version) VALUES ('20120730154008');

INSERT INTO schema_migrations (version) VALUES ('20120731034349');

INSERT INTO schema_migrations (version) VALUES ('20120731034844');

INSERT INTO schema_migrations (version) VALUES ('20120731090615');

INSERT INTO schema_migrations (version) VALUES ('20120731140454');

INSERT INTO schema_migrations (version) VALUES ('20120731140542');

INSERT INTO schema_migrations (version) VALUES ('20120731155840');

INSERT INTO schema_migrations (version) VALUES ('20120731155959');

INSERT INTO schema_migrations (version) VALUES ('20120801031443');

INSERT INTO schema_migrations (version) VALUES ('20120801031716');

INSERT INTO schema_migrations (version) VALUES ('20120806155622');

INSERT INTO schema_migrations (version) VALUES ('20120807021352');

INSERT INTO schema_migrations (version) VALUES ('20120811035147');

INSERT INTO schema_migrations (version) VALUES ('20120811035206');

INSERT INTO schema_migrations (version) VALUES ('20120811044224');

INSERT INTO schema_migrations (version) VALUES ('20120811052314');