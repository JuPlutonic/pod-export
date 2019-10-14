# Be sure to restart your server when you modify this file.

# STEP 1: `rails tmp:clear`
# STEP 2: Rails.application.config.session_store :cookie_store, key: '1'
#         ('1' was '_PodExport_session')
# STEP 3: clean browser's cache and try to start app 'rails s'
# STEP 4: return back key:
Rails.application.config.session_store :cookie_store, key: '_PodExport_session'
