#
# A simple Makefile
#

######

PATSCC=patscc
PATSHOMEQ="$(PATSHOME)"

######

all::

######

all:: \
fibonacci
fibonacci:: ; $(PATSCC) -tcats fibonacci.dats

######

all:: \
tally
tally:: ; $(PATSCC) -tcats tally-of-powers.dats

######

all:: \
Bezout_identity
Bezout_identity:: ; $(PATSCC) -tcats Bezout_identity.dats

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
