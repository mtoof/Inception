<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'database_name_here' );

/** Database username */
define( 'DB_USER', 'username_here' );

/** Database password */
define( 'DB_PASSWORD', 'password_here' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'eU.p;C5R  _nfT|]Ej3Qv=[</336#co.*Z;O}@@AUcTAF+tYbB(d,1yQ;<Ih]<[+');
define('SECURE_AUTH_KEY',  'M0D:WEu#unIttsJY1 KaG*J5-e>W%y?%X;!Js97@3ybDy|Yp(4wIb._2X+)?L8rO');
define('LOGGED_IN_KEY',    '2zn`?*+(|FcAl~|}RIaY-&~1Lv_?Iu}^j{Y7XK*EZ r4-]pEOi^a+.+};W$2+ G}');
define('NONCE_KEY',        '0.!LlUwpG-26VooIz3rHfBJs]}%:6vbWJ# *PG<mDt(4chyPo++v:$%8S0PT`-3J');
define('AUTH_SALT',        '7b|qVYY_#j&V-K8g|7KM;FP|I,Ijas+&L8rDUfd5;S`xZP)/Ei+D^fzriGn.yjFG');
define('SECURE_AUTH_SALT', 'xt?UAn]g((oDm^-OL>R;w_YLK(G oZ/zZ/R,|>86j|pH|o[3~XaPi^B,Z@C&F+J|');
define('LOGGED_IN_SALT',   '1;Qi.dZ/I$cZB(syesp50m.f<{1a3ET01:WKL=[^L8L3vI7!BH1Zqy6,Z+|uhmh8');
define('NONCE_SALT',       'I&SFp&i2!.7uX{o})Y hV2)h8;,`#8+p KE ]{_alk~_@owMWPrI9e, ub!9;Xy|');;

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
