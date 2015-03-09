<?php
function example_install_tasks($install_state) {
  $tasks = array (
    'example_configure' => array(),
  );
  return $tasks;
}

/**
 * Set up base config
 */
function example_configure() {
  // Set default example variables
  variable_set('cache', 1);
  variable_set('block_cache', 1);
  variable_set('cache_lifetime', '0');
  variable_set('page_cache_maximum_age', '900');
  variable_set('page_compression', 0);
  variable_set('preprocess_css', 0);
  variable_set('preprocess_js', 0);
  $search_active_modules = array(
    'apachesolr_search' => 'apachesolr_search',
    'user' => 'user',
    'node' => 0
  );
  variable_set('search_active_modules', $search_active_modules);
  variable_set('search_default_module', 'apachesolr_search');
  drupal_set_message(t('Example Defaults configured.'));

  // theme enable

$theme = 'example';
theme_enable(array('zen'));
theme_enable(array($theme));
variable_set('theme_default', $theme);
variable_set('admin_theme', 'seven');

// Set the Bartik or Garland logo to be Panopoly's logo
//  if ($theme == 'bartik' || $theme == 'garland' || $theme == 'responsive_bartik') {
//    $theme_data = _system_rebuild_theme_data();
//    $theme_data[$theme]->info['settings']['default_logo'] = 0;
//    $theme_data[$theme]->info['settings']['logo_path'] = drupal_get_path('module', 'panopoly_theme') . '/images/panopoly_icon_theme.png';
//    variable_set('theme_' . $theme . '_settings', $theme_data[$theme]->info['settings']);
//  }

// Flush theme caches so things are right
system_rebuild_theme_data();
drupal_theme_rebuild();

}
