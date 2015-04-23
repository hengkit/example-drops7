<?php
/**
 * @file
 * demo_configuration.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function demo_configuration_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function demo_configuration_node_info() {
  $items = array(
    'splash_content' => array(
      'name' => t('Splash Content'),
      'base' => 'node_content',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
