
(define (domain parking)

(:requirements :typing)

(:types 
	car
	road 
	position
	direction)

(:predicates   

		(at_position ?c - car ?p - position)
		

        (occupied ?p - position)
		(not_occupied ?p - position)
                                                  
        (is_parked ?c - car)

		(adjacent ?p1 ?p2 - location)

		(is_cr ?cr - position)
		(is_pk ?p - position)

		(locate ?p1 ?p2 - position ?d - direction)
		(belong ?p - position ?r - road)
)

(:action drive

 :parameters    (?c - car ?from ?to - position ?r - road)

 :precondition  (and
 				(is_pk ?from) 
 				(belong ?from ?r)                               
                 (at_position ?c ?from)
		 		(adjacent ?from ?to)
              )

 :effect        (and
		                                     
				(at_position ?c ?to)
				(not (at_position ?c ?from))
                )
)

(:action turn
 
 :parameters	(?c - car ?from ?to - position ?r - road ?d - direction)
 
 :precondition	(and
		 (is_cr ?from)
		 (belong ?to ?r)
		 (locate ?to ?from ?d) 		
		 (at_position ?c ?from)
		 (adjacent ?from ?to)

		)
 :effect	(and
		 (at_position ?c ?to)
		 (not (at_position ?c ?from))

		)
)


(:action park
 :parameters (?c - car ?p - position ?r - road)
 :precondition (and (at_position ?c ?p)                  
		    (not_occupied ?p)
		    (belong ?p ?r)
               )
 :effect (and (is_parked ?c)		
              (occupied ?p)
	      (not (not_occupied ?p))
         )
)

)
