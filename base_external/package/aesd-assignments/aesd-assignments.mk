
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 37fcfbb0162c7f3419c4e11508eba2cbcc3b994b
# Above is for Assignment 3 and later
# AESD_ASSIGNMENTS_VERSION = 83e5dfa52a482c76980e69e1f231c32a03c68910  # assignment-autotest (HW 4 Part 2)
# AESD_ASSIGNMENTS_VERSION = e687e3815f76c1c5ea9fb52b6558bedfe53ab117  # buildroot (HW 4 Part 2)
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-ssolusa.git
# ssolusa; above was: '#GITHUB REPOSITORY LINK'
# AESD_ASSIGNMENTS_SITE = "git@github.com:cu-ecen-aeld/assignment-4-ssolusa.git"
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/bin/writer
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin/finder.sh
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin/finder-test.sh
endef

$(eval $(generic-package))
