-----------------------
-- users
-----------------------

insert into builtinuser(	id, affiliation, email, firstname, lastname, position, username)
	select			id, institution, email, firstname, lastname, position, username
	from _dvn3_vdcuser;

insert into authenticateduser(	id, affiliation, email, firstname, lastname, position, useridentifier, superuser)
	select			id, institution, email, firstname, lastname, position, username, false
	from _dvn3_vdcuser;

insert into authenticateduserlookup(	authenticationproviderid, persistentuserid, authenticateduser_id)
	select				'builtin',  username, id
	from _dvn3_vdcuser;

-----------------------
-- groups
-----------------------

-- only copy over groups that have users
insert into explicitgroup(  id, description, displayname, groupalias, groupaliasinowner, owner_id)
        select (id, friendlyname, friendlyname, '1-'||name, name, 1)
        from _dvn3_usergroup
        where;

insert into explicitgroup_authenticateduser(  explicitgroup_id, containedauthenticatedusers_id)
        select usergroups_id, users_id
        from _dvn3_vdcuser_usergroup;