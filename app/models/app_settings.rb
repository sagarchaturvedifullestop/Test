class AppSettings
  # This class is used to retrieve values from app_settings.yml and use it.
  
  APP_SETTINGS_FILE = "#{Rails.root}/config/app_settings/app_settings.yml"
  APP_SETTINGS_LOCAL_FILE = "#{Rails.root}/config/app_settings/app_settings.local.yml"
  
  @app_settings = YAML::load(File.open(APP_SETTINGS_FILE))
  @app_settings = @app_settings.merge(YAML::load(File.open(APP_SETTINGS_LOCAL_FILE))) if FileTest.exists?(APP_SETTINGS_LOCAL_FILE)
  
  def self.[](key)
    @app_settings[key.to_s] || nil
  end
end