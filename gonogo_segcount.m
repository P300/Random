Files2 = dir(strcat('/Users/EGI/Desktop/ADHDEEG/GoNogo2/log2/','*.txt'));
lengthFiles2 = length(Files2);

for ff = 1:lengthFiles2
    ff
    try
        filename = Files2(ff).name;
        idx=strfind(filename,'_');
        name{ff} = filename(1:idx(1)-1); %pay attention to dash lines in the file. idx(#), the # should not exceed the dash lines in the file name
        path = strcat('/Users/EGI/Desktop/ADHDEEG/GoNogo2/log2/',filename);
        data = readtable(path);
        category = data(:,1);
        segmentgood = data(:,3);

        record = zeros(size(category,1),2);

% try catch was used to  execute code after the program encounters an error, disable it if no need 
        for i=1:size(category,1)
           % try                       
                tt = category(i,1).Category{1};
           % catch
              %  tt = category(i,1).Var1{1};
            %end
        if strcmp(tt,'go')

                record(i,1)=1;
        elseif strcmp(tt,'nogo')

                record(i,2)=1;
       % elseif strcmp(tt,'slow')

               % record(i,3)=1;
        end

        end


        segment = zeros(size(segmentgood,1),2);


        for i=1:size(category,1)
           % try
                tt = segmentgood(i,1).SegmentGood{1};
           % catch

               % tt = segmentgood(i,1).Var3{1};
           % end

            if strcmp(tt,'true')

                    segment(i,1)=1;
            elseif strcmp(tt,'false')

                    segment(i,2)=1;

            end

        end

        goTrue = 0;
        nogoTrue=0;
        %ErrorTure=0;

        for i=1:size(category,1)
          if record(i,1)==1&segment(i,1)==1
              goTrue=goTrue+1;
          else record(i,2)==1&segment(i,1)==1

                nogoTrue=nogoTrue+1;
          %elseif record(i,3)==1&segment(i,1)==1
               % SlowTrue=SlowTrue+1;
          end

        end

        result(ff,1:2) = [goTrue nogoTrue];

        result2(ff,1:2) = [sum(record)];
    end
end

results = {};
results2={};
for i=1:lengthFiles2

  results {i,1} = name{i};
  results {i,2} = result(i,1);
  results {i,3} = result(i,2);
  %results {i,4} = result(i,3);
  results2 {i,1} = name{i};
  results2 {i,2} = result2(i,1);
  results2 {i,3} = result2(i,2);
 % results2 {i,4} = result2(i,3);

end

xlswrite('/Users/EGI/Desktop/ADHDEEG/GoNogo2/log2/.xls',results,'results');
