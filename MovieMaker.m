classdef MovieMaker < handle
    %MOVÝEMAKER is created to capture screens of plot which uses multiple
    %subplots and creates animation files. In this application you can
    %   - Convert movie
    %   - Resample
    
    properties
        frames % Movie frames
        name % Name of the filename
        path % path of animation save
        coords % grid coordinates
        delay % delay time between frames
    end
    
    methods
        function obj = MovieMaker(name)
            if nargin > 0
                obj.name = name;
                %obj.frames = {};
                obj.path = '';
                obj.delay = 0.25;
            end
        end
        
        function obj = AddFrame(obj)
            drawnow;
            frame = getframe(gcf);
            %frame = getframe(gcf,obj.coordinates);
            obj.frames{obj.getLength()+1} = frame;
        end
        
        function F = GetInterval(obj,startf,endf)
            for i=startf:endf
                F{i-startf+1} = obj.frames{i};
            end
        end
        
        function F = ResampleMovie(obj,rate)
            c = 1;
            for i=1:rate:obj.getLength()
                F{c} = obj.frames{i};
                c = c + 1;
            end
        end
        
        function obj = Save(obj)
            k = getLength(obj);
            [im,map] = rgb2ind(obj.frames{k}.cdata,256,'nodither');
            im(1,1,1,36) = 0;
            for x=1:k
                im(:,:,1,x) = rgb2ind(obj.frames{x}.cdata,map,'nodither');
            end
            
            imwrite(im,map,[obj.path '/' obj.name '.gif'],...
                'DelayTime',0.2)
        end
        
        function len = getLength(obj)
           len = length(obj.frames); 
        end
        
        function frames = get.frames(obj)
           frames = obj.frames; 
        end
        function obj = set.frames(obj,frames)
           obj.frames = frames; 
        end
        
        function name = get.name(obj)
           name = obj.name; 
        end
        function obj = set.name(obj,name)
           obj.name = name; 
        end
        
        function path = get.path(obj)
           path = obj.path; 
        end
        function obj = set.path(obj,path)
           obj.path = path; 
        end
        
        function coords = get.coords(obj)
           coords = obj.coords; 
        end
        function obj = set.coords(obj,coords)
           obj.coords = coords; 
        end
        
        function delay = get.delay(obj)
           delay = obj.coords; 
        end
        function obj = set.delay(obj,delay)
           obj.delay = delay; 
        end
    end
    
    
end

