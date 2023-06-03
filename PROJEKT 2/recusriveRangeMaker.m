% function Ranges = RangeMaker(Ranges, range, num_of_roots)
%     % Rekurencyjna funkcja odnajdująca przedziały izolacji pierwiastków
%     if size(range) == 1
%         return
%     end
%     if num_of_roots ~= 0 
% 
%         L = range(1:ceil(end/2));
%         M = range(ceil(end/2)+1:end);
% 
%         if Function(L(1)) * Function(L(end)) < 0
%             Ranges{end+1} = L;
%             num_of_roots = num_of_roots - 1;
%             if num_of_roots == 0
%                 return
%             end
%         end
%         if Function(M(1)) * Function(M(end)) < 0
%             Ranges{end+1} = M;
%             num_of_roots = num_of_roots - 1;
%             if num_of_roots == 0
%                 return
%             end
%         end
% 
%         Ranges = RangeMaker(Ranges, L, num_of_roots);
%         Ranges = RangeMaker(Ranges, M, num_of_roots);
%     else 
%         return
%     end
% end
% 
% % function Ranges = RangeMaker(Ranges, range, num_of_roots)
% %         if num_of_roots == 1
% %             Ranges = range;
% %             return
% %         end
% % 
% %         L = range(1:ceil(end/2));
% %         M = range(ceil(end/2)+1:end);
% % 
% %         if Function(L(1)) * Function(L(end)) < 0
% %             Ranges{end+1} = L;
% %             num_of_roots = num_of_roots - 1;
% %             if num_of_roots == 0
% %                 return
% %             end
% %         end
% %         if Function(M(1)) * Function(M(end)) < 0
% %             Ranges{end+1} = M;
% %             num_of_roots = num_of_roots - 1;
% %             if num_of_roots == 0
% %                 return
% %             end
% %         end
% % end