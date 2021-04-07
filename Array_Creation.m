function singleE = transducerArray(x_size,Tpointsx,wavelength,array_elements,mesh_size,type)

switch(type) 
    case {1}
        x = Tpointsx(1:end/array_elements);
%         y_size = length(Tpointsx)/array_elements;
%         y_size = min(find(Tpointsx>(1/array_elements)));
%         y_size
%         (-y_size)*0.5
%         Tpointsy = Tpointsx(:,1:y_size);
%         Tpointsy = (-y_size)*0.5:mesh_size:y_size*0.5;
%         Tpointsy = Tpointsy(1:length(Tpointsy));
%         
%         length(Tpointsx), length(Tpointsy)
        singleE = zeros(length(Tpointsx), length(x));
        size(singleE)
%         
        singleE(:,1:end/8) = 1;


%         elemx=linspace(0,wavelength,8);
%     
%         elemx=elemx(1:length(elemx)-1);
%         elembeg=min(find(elemx>(0.05*)));
%         find(elemx>(0.6*lambda2))
%         elemend=min(find(elemx>(0.6*wavelength)));
%         elemamp=zeros(length(Tpointsx),length(elemx));
%         elemamp(1:elemend)=1;
%         
%         singleE = elemamp;
    case {2}
%         tArea = x_size * x_size;
%         aoe = tArea / (array_elements.^2);
%         
%         xSegment = sqrt(aoe) - spacing;
%         xTransducer = xSegment - spacing;
%         
%         singleTx = -(xSegment)*0.5:mesh_size:xSegment*0.5;
%         singleE = zeros(length(singleTx), length(singleTx));
%         
%         if xTransducer > spacing
%             indy=0;
%             for y = -(xSegment)*0.5:mesh_size:xSegment*0.5
%                 indy=indy+1;
%                 indx=0;
%                 if y >= ((-(xTransducer)*0.5) + (spacing*0.5)) && y <= ((xTransducer*0.5) - (spacing*0.5))
%                     for x = -(xSegment)*0.5:mesh_size:xSegment*0.5
%                         indx=indx+1;
%                         if x >= ((-(xTransducer)*0.5) + (spacing*0.5)) && x <= ((xTransducer*0.5) - (spacing*0.5))
%                             singleE(indy,indx) = 1;
%                         end
%                     end
%                 end
%             end
%         else
%             singleT = 0;
%         end

        x = Tpointsx(1:end/array_elements);
        singleE = ones(length(x), length(x));
        size(singleE)
%         
        singleE(1:end/5,1:end/5) = 0;
end