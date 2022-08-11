#-------------------------SO_LONG RAYMBOX TEST----------------------------------

#USE make raym_test -k

R = $(shell tput -Txterm setaf 1)
G = $(shell tput -Txterm setaf 2)
C = $(shell tput -Txterm setaf 6)
W = $(shell tput -Txterm setaf 7)
Y = $(shell tput -Txterm setaf 3)
Z = $(shell tput -Txterm setaf 5)

DIR_NAME = $(shell pwd)/maps
NB_TEST = 24

all:
	@make tests -k

tests:
	@make clear 
	@make entete_test 
	@make arg0
	@make arg2
	@make nexist 
	@make no_right 
	@make txt_map 
	@make no_extension 
	@make vide 
	@make error1 
	@make error2 
	@make error3
	@make error4
	@make bad1 
	@make bad2 
	@make bad3 
	@make bad4 
	@make bad5
	@make bad6
	@make bad7
	@make bad8
	@make entete_tricky
	@make doss
	@make not_ascii
	@make not_ascii2
	@make not_ascii3
	@make extra_line_char
	@make fin_des_tests

name:
		echo $(DIR_NAME)

clear:
	@clear

entete_test:
	@echo "$Z\n\n\n-------------------------------------RAYMBOX SO_LONG TEST------------------------------------------\n$W"
	@echo "- $RAucune map ne devrait se loader.$W"
	@echo "- Le programme doit inscrire Error" 
	@echo "    suivi d'un message d'erreur correspondant au test sur la ligne suivante."
	@echo "- Si un message ressemblant a ($Gmake: *** [test] Error x$W) s'affiche apres le message,"
	@echo "    c'est que le programme retourne autre chose que 0 lors de la gestion d'erreur. $GC'est OK.$W"
	@echo "- Par contre, aucune ligne ($R/bin/sh: line 1: 70244 Segmentation fault:...$W) ne devrait s'afficher."
	
#1
arg0:
	@echo "\n"
	@echo "$G1/$(NB_TEST)   Sans argument$W"
	@cd .. && ./so_long

#2
arg2:
	@echo "\n"
	@echo "$G2/$(NB_TEST)   2 arguments$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_good.ber" "map_good.ber"
	
#3
nexist:
	@echo "\n"
	@echo "$G3/$(NB_TEST)   map qui n'existe pas / wrong path$W"
	@cd .. && ./so_long "$(DIR_NAME)/not_existing_map.ber"

#4
no_right:
	@echo "\n"
	@echo "$G4/$(NB_TEST)   map no right                     $Y<map_noright.ber>$W"
	@chmod 000 $(DIR_NAME)/map_noright.ber
	@cd .. && ./so_long "$(DIR_NAME)/map_noright.ber"
	@chmod 777 $(DIR_NAME)/map_noright.ber

#5
txt_map:
	@echo "\n"
	@echo "$G5/$(NB_TEST)   map terminant par .txt              $Y<map_good.txt>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_good.txt"

#6
no_extension:
	@echo "\n"
	@echo "$G6/$(NB_TEST)   map sans extension                     $Y<map_nober>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_nober"

#7
vide:
	@echo "\n"
	@echo "$G7/$(NB_TEST)   map vide                            $Y<map_vide.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_vide.ber"

#8
error1:
	@echo "\n"
	@echo "$Z               -----    map non carre    -----"
	@echo "$G8/$(NB_TEST)   one more char in one line          $Y<map_error.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_error.ber"

#9
error2:
	@echo "\n"
	@echo "$G9/$(NB_TEST)   one more 1 in one line            $Y<map_1more1.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_1more1.ber"

#10
error3:
	@echo "\n"
	@echo "$G10/$(NB_TEST)  one line smaller               $Y<map_notsquare.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_notsquare.ber"

#11
error4:
	@echo "\n"
	@echo "$G11/$(NB_TEST)  one line of wall                $Y<map_1wallline.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_1wallline.ber"

#12
bad1:
	@echo "\n"
	@echo "$Z          -----   Parcing conditions tests   -----"
	@echo "$G12/$(NB_TEST)  no player                            $Y<map_noP.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_noP.ber"

#13
bad2:
	@echo "\n"
	@echo "$G13/$(NB_TEST)  no collectable                       $Y<map_noC.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_noC.ber"

#14
bad3:
	@echo "\n"
	@echo "$G14/$(NB_TEST)  no exit                              $Y<map_noE.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_noE.ber"

#15
bad4:
	@echo "\n"
	@echo "$G15/$(NB_TEST)  2 players                        $Y<map_doubleP.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_doubleP.ber"

#16
bad5:
	@echo "\n"
	@echo "$G16/$(NB_TEST)  not authorize char in wall   $Y<map_badcharwall.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_badcharwall.ber"

#17
bad6:
	@echo "\n"
	@echo "$G17/$(NB_TEST)  not authorize char inside wall $Y<map_badcharin.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_badcharin.ber"

#18
bad7:
	@echo "\n"
	@echo "$G18/$(NB_TEST)  2 line of wall                 $Y<map_2wallline.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_2wallline.ber"

#19
bad8:
	@echo "\n"
	@echo "$G19/$(NB_TEST)  exit in wall                 $Y<map_exitinwall.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_exitinwall.ber"


entete_tricky:
	@echo "$Z\n------	tricky test (fail est laisse a votre discretion)  ------$W"

#20
doss:
	@echo "\n"
	@echo "$G20/$(NB_TEST)  directory au lieu d'un file              $Y<dir.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/dir.ber"

#21
not_ascii:
	@echo "\n"
	@echo "$G21/$(NB_TEST)  char not ascii in valid map     $Y<map_notascii.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_notascii.ber"

#22
not_ascii2:
	@echo "\n"
	@echo "$G22/$(NB_TEST)  only 1 char not ascii      $Y<map_1charnotascii.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_1charnotascii.ber"

#23
not_ascii3:
	@echo "\n"
	@echo "$G23/$(NB_TEST)  all map char not ascii       $Y<map_bignotascii.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_bignotascii.ber"

#24
extra_line_char:
	@echo "\n"
	@echo "$G24/$(NB_TEST)  add extra line + space    $Y<map_extraspaceline.ber>$W"
	@cd .. && ./so_long "$(DIR_NAME)/map_extraspaceline.ber"

fin_des_tests:
	@echo "$Z\n-----------------------FIN DES TESTS-------------------------\n$W"

#-------------------------------------------------------------------------------------