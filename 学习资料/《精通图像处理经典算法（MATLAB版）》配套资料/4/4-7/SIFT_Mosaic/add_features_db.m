function [database,handle] = add_features_db( im, pos, scale, orient, desc, existing_database )
if exist('existing_database')
        database = existing_database;
else
        database.pos = [];
        database.scale = [];
        database.orient = [];
        database.desc = [];
        database.index = [];
        database.im = {};
        database.num_im = 0;
end
        database.num_im = database.num_im + 1;
        database.im{database.num_im} = im;
        database.index  = [database.index; database.num_im*ones(size(pos,1),1)];
if nargout == 2
   handle = database.num_im;
end
        database.pos    = [database.pos; pos];
        database.scale  = [database.scale; scale];
        database.orient = [database.orient; orient];
        database.desc   = [database.desc; desc];
end
