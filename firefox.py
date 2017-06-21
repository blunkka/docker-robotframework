def use_default_profile():
	from selenium import webdriver
	from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
	capabilities = DesiredCapabilities.FIREFOX
	capabilities['marionette'] = False
	capabilities['acceptSslCerts'] = True
	profile = webdriver.FirefoxProfile()
	profile.accept_untrusted_certs = True
	profile.update_preferences()
	return profile.path
