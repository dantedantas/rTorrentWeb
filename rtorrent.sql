/*
 * rTorrentWeb version 0.1 prerelease
 * $Id$
 * Copyright (C) 2009, Daniel Lo Nigro (Daniel15) <daniel at d15.biz>
 * 
 * This file is part of rTorrentWeb.
 * 
 * rTorrentWeb is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * rTorrentWeb is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with rTorrentWeb.  If not, see <http://www.gnu.org/licenses/>.
 */

CREATE TABLE roles (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT UNIQUE NULL,
	description TEXT  NULL
);
INSERT INTO roles VALUES (1, 'login', 'Login privileges, granted after account confirmation');
INSERT INTO roles VALUES (2, 'admin', 'Administrative user, has access to everything.');

CREATE TABLE roles_users (
	user_id INTEGER  NULL,
	role_id INTEGER  NULL
);

CREATE TABLE settings (
	variable TEXT NOT NULL PRIMARY KEY,
	value TEXT NOT NULL
);
INSERT INTO settings VALUES ('db_version', '1');

CREATE TABLE torrents (
	hash TEXT  UNIQUE NULL,
	user_id INTEGER  NULL,
	private BOOLEAN DEFAULT '''''''0''''''' NULL
);

CREATE TABLE user_tokens (
	id INTEGER  NULL PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER  NULL,
	user_agent TEXT  NULL,
	token TEXT  UNIQUE NULL,
	created INTEGER  NULL,
	expires INTEGER  NULL
);

CREATE TABLE users (
	id INTEGER  PRIMARY KEY AUTOINCREMENT NULL,
	email text  UNIQUE NULL,
	username text  UNIQUE NULL,
	password text  NULL,
	logins INTEGER  NULL,
	last_login INTEGER  NULL,
	homedir text  NULL
);

CREATE INDEX key_user_id ON user_tokens (
	user_id  DESC
);

CREATE TABLE ext_feeds (
	id INTEGER PRIMARY KEY AUTOINCREMENT NULL,
	user_id INTEGER  NULL,
	name TEXT  NULL,
	url TEXT  NULL
);