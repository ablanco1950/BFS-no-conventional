;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 
;;; Alfonso Blanco García, October 2021
;;;
;;; BFS no conventional
;;; It receives the node to search and the list of nodes with their descendants in which to search 
;;; Explore according to the BFS algorithm
;;; It will return the path followed by the nodes until reaching the goal
;;; The input function is shortest-path
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Busca_nodos_lista_2 ( objetivo lista grafo camino listacaminos)
;
;  Function you receive:
;  - The target node (objetivo)
;  - The list of nodes to inspect one after another according to the Bfs algorithm (lista)
;  - The list of nodes that make up the graph (grafo)
;  - The path followed until reaching the list that has been received (camino)
;  - The list of paths that reach the goal following the algorithm BFS
;     The  option is to search not only the first path, but also all the
;    possible according to the BFS algorithm) (listacaminos)
;
;   Bring back:
;  - The list of paths that goes to the goal following the BFS algorithm, updated
;
;   Detects:
;  - If the explored node was already on the path
;    In which case it skips it, as it would result in a loop
;
;  - If the target node is in the list, consider that a solution has been found,  
;    otherwise it continues recursively searching for itself to search with the other values.
;
;   - When finished, repeat the process with the lists of descendants of the first
;     element of the list and continue the same process with the rest
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun Busca_nodos_lista_2 ( objetivo lista grafo camino listacaminos)
   
 
    (unless ( null lista)
      
      ;;; If the node has already been visited, look at the next one in the list at the same level
      (cond ((member (first lista) camino)
             (Busca_nodos_lista_2 objetivo (rest lista)  grafo camino listacaminos)

              )
 
       (t
          
            ; Explore the received list in width
            ( if (eql opcion  1)
                 ()
              (Busca_nodos_lista_2 objetivo (rest lista)  grafo camino listacaminos))
        
                        
            ; Update the path
            (setq camino1 (cons (first lista) camino))
            
            ;;; For each node in the received list, it obtains and processes
            ;;; the child nodes. Using the assoc function, the child nodes are located 
            ;;; 

            (setq nodo_busca_siguientes (assoc (first lista) grafo))
      
            ( setq lista2 (rest nodo_busca_siguientes))
            ( if (member (first lista2) camino1)
                (remove (first lista2) lista2))
            (unless ( null lista2)
    
                 (cond (( member objetivo lista2)
                       (setq camino1 (cons objetivo camino1))

                       (format t "Found target node, path: ~a~%" ( reverse camino1))
                       (format t "~%") 

                       (if (eql opcion 1 )
                          (setq lista2 '()))
                       (if (eql opcion 1 )
                           (setq lista '()))

                  
                       (setq listacaminosglobal (cons (reverse camino1) listacaminosglobal))
                     
                         
                 )
                 (t
                 (if (eql opcion 1)     
                    (Busca_nodos_lista_2 objetivo ( rest lista)  grafo camino listacaminos))
                 
                 (Busca_nodos_lista_2 objetivo lista2  grafo camino1 listacaminos)
              

             )


           )
    )  ;;; end (unless ( null lista2)

    ) ;;; end t
          
   ) ;;; end cond
   ) ;;; end unless (null lista)

 
)

(defun shortest-path (start end net camino)
  (defvar listacaminosglobal)
  (setq listacaminosglobal '(()))
  (defvar opcion)  
  (setq opcion 2)  ;;; Option 1 find only the first path that leads the target
                   ;;; Option 2 find all the paths leading to the goal by following BFS
 
  (Busca_nodos_lista_2 end  (list start) net camino listacaminosglobal)
  ( if (eql opcion 1)
      (first listacaminosglobal)
      ( rest(reverse  listacaminosglobal))
    )

  )
  
;*******************************************************************************
;  
; TESTS 
; Taken from material of the practical classes of Artificial Intelligence of the
; Higher Polytechnic School. Computer Engineering.  
; Autonomous University of Madrid
;*******************************************************************************

;
;Directed graph
;
(time (shortest-path 'a 'f '((a d) (b d f) (c e) (d f) (e b f) (f))'()))
(time (shortest-path 'a 'f '((a d) (b d f) (c e) (d e) (e b f) (f)) '()))
(time (shortest-path 'c 'd '((a d) (b d f) (c e) (d e) (e b f) (f)) '()))
(time (shortest-path 'c 'f '((a d) (b d f) (c e) (d e) (e b f) (f)) '()))



;
; Non directed graph
;
(time (shortest-path 'f 'c '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'f 'g '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'b 'e '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'f 'e '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'f 'd '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'f 'h '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

(time (shortest-path 'f 'd '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))


;;; Search for w that is not in the tree, it ends up giving nil
(time (shortest-path 'f 'w '((a b c d e) (b a d e f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))

;;; Case of a cycle (a f) (f a), , it ends up giving nil
(time (shortest-path 'f 'c '((f a) (a f) (c a g) (d a b g h) (e a b g h) (f b h) (g c d e h) (h d e f g))'()))
