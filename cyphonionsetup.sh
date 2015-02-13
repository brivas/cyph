#!/bin/bash

# Tor server setup script for Ubuntu 14.04

onionaddress='cyphdbyhiddenbhs.onion'
onionkey='ASK RYAN FOR THIS'
cert='LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tDQpNSUlGY3pDQ0JGdWdBd0lCQWdJUUI3OGwyL3dqV3p2cWdYWGtTd2NEQ0RBTkJna3Foa2lHOXcwQkFRc0ZBREJODQpNUXN3Q1FZRFZRUUdFd0pWVXpFVk1CTUdBMVVFQ2hNTVJHbG5hVU5sY25RZ1NXNWpNU2N3SlFZRFZRUURFeDVFDQphV2RwUTJWeWRDQlRTRUV5SUZObFkzVnlaU0JUWlhKMlpYSWdRMEV3SGhjTk1UVXdNVEUyTURBd01EQXdXaGNODQpNVFV4TURJd01USXdNREF3V2pCZk1Rc3dDUVlEVlFRR0V3SlZVekVSTUE4R0ExVUVDQk1JUkdWc1lYZGhjbVV4DQpEakFNQmdOVkJBY1RCVVJ2ZG1WeU1STXdFUVlEVlFRS0V3cERlWEJvTENCSmJtTXVNUmd3RmdZRFZRUURFdzl1DQpZUzVqWkc0dVkzbHdhQzVqYjIwd2dnRWlNQTBHQ1NxR1NJYjNEUUVCQVFVQUE0SUJEd0F3Z2dFS0FvSUJBUUM5DQp1Q2JvK2wwNVlFK1QyMXViWFU4dnhXWTFOOFY3OXRoK1JVWDdFRlQzdXF0RzAyVVJqTlZwZFVLK3VmZ2pUaHh6DQpTSlFZam9XS0svcXZ6dXYzRlNTaVRDTWtCcFY5dkNIcklLTmtJQXpFcTVZU2JrQkMvL3hGeWQ2L0h5N1FoWWR5DQo2Uk1ITGV4SDV4RmFYVmNmZFRTbW5rdVczc3RrMG1HRDBZM3FZQVdFTHJkNjFCT3ZFalZsTHlONVJLdGNuTFgrDQoyeThTZUpic3lJYkpQU3B0bDNMMnU5QWJaL3NzYXZVbjUrV0RZR2ZqdnFsVWsvS0lkWlBuQThCK3FaeGdYK2ZPDQp1Sy8wRVl5WXdUV3NFUEtGZnkrOEFkVGEySVlEaFpnU0w5eHhuQmlteXVTQWNUcDNTQjExTmV1NklhdjV2K1RmDQptV3hQYU9CWHV6TFlWb3REWFpMaEFnTUJBQUdqZ2dJN01JSUNOekFmQmdOVkhTTUVHREFXZ0JRUGdHRWNnakZoDQoxUzhvNTQxR09MUXM0Y2JaNGpBZEJnTlZIUTRFRmdRVUJhM1M1a2E5YkhSYUtmY1JTMmcrbDdodUk2a3dnWWdHDQpBMVVkRVFTQmdEQitnZzl1WVM1alpHNHVZM2x3YUM1amIyMkNEMkZtTG1Oa2JpNWplWEJvTG1OdmJZSVBZWE11DQpZMlJ1TG1ONWNHZ3VZMjl0Z2c5bGRTNWpaRzR1WTNsd2FDNWpiMjJDRDI5akxtTmtiaTVqZVhCb0xtTnZiWUlQDQpjMkV1WTJSdUxtTjVjR2d1WTI5dGdoWmplWEJvWkdKNWFHbGtaR1Z1WW1oekxtOXVhVzl1TUE0R0ExVWREd0VCDQovd1FFQXdJRm9EQWRCZ05WSFNVRUZqQVVCZ2dyQmdFRkJRY0RBUVlJS3dZQkJRVUhBd0l3YXdZRFZSMGZCR1F3DQpZakF2b0MyZ0s0WXBhSFIwY0RvdkwyTnliRE11WkdsbmFXTmxjblF1WTI5dEwzTnpZMkV0YzJoaE1pMW5NeTVqDQpjbXd3TDZBdG9DdUdLV2gwZEhBNkx5OWpjbXcwTG1ScFoybGpaWEowTG1OdmJTOXpjMk5oTFhOb1lUSXRaek11DQpZM0pzTUVJR0ExVWRJQVE3TURrd053WUpZSVpJQVliOWJBRUJNQ293S0FZSUt3WUJCUVVIQWdFV0hHaDBkSEJ6DQpPaTh2ZDNkM0xtUnBaMmxqWlhKMExtTnZiUzlEVUZNd2ZBWUlLd1lCQlFVSEFRRUVjREJ1TUNRR0NDc0dBUVVGDQpCekFCaGhob2RIUndPaTh2YjJOemNDNWthV2RwWTJWeWRDNWpiMjB3UmdZSUt3WUJCUVVITUFLR09taDBkSEE2DQpMeTlqWVdObGNuUnpMbVJwWjJsalpYSjBMbU52YlM5RWFXZHBRMlZ5ZEZOSVFUSlRaV04xY21WVFpYSjJaWEpEDQpRUzVqY25Rd0RBWURWUjBUQVFIL0JBSXdBREFOQmdrcWhraUc5dzBCQVFzRkFBT0NBUUVBa2I4U3ZaQThzc0haDQp1WjdUcHVPa3BHNVVaMVRhS0V0OXJBUUhWcHU1aytnalk3dWNqME51dXhHU3VMSkxxd2lZTk5KUW4wUVJjRCtUDQpUbVh6T3NLeU9kdzc5djVLVzduSVV5TURiR1Iyc1kwREV3NGsvMDMrMHVlZk8xdUVvTXFXUWdhRTZiYSttZE9ZDQo0YzZDaGdBWHNGSHRnL0dvQ0VBdVRNWlhUN1NpZHVjd2I4a3ZTdE94QUdWTWxQWmYyZkIyVHVwUFpXMlM2dmdZDQowK0N1U1ZHVVppT2xMdWF2aFhKanNHTjlJN1lrQTU5WXZ0ZGMvQzR1ZnhBd0toT3VzV215ZUlkbHJrbGgxRWE4DQpmOC9veFNYeVJzZEw2Ry9DaHdHeGhDWGpObWl1Ly8yRTlVdHoyWUZBU3FlWnZjdElJKzV2emZQUnVJRXFBVEh5DQo4MHh3S1JML1F3PT0NCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0NCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQ0KTUlJRWxEQ0NBM3lnQXdJQkFnSVFBZjJqNjI3S2RjaUlRNHR5UzgrOGtUQU5CZ2txaGtpRzl3MEJBUXNGQURCaA0KTVFzd0NRWURWUVFHRXdKVlV6RVZNQk1HQTFVRUNoTU1SR2xuYVVObGNuUWdTVzVqTVJrd0Z3WURWUVFMRXhCMw0KZDNjdVpHbG5hV05sY25RdVkyOXRNU0F3SGdZRFZRUURFeGRFYVdkcFEyVnlkQ0JIYkc5aVlXd2dVbTl2ZENCRA0KUVRBZUZ3MHhNekF6TURneE1qQXdNREJhRncweU16QXpNRGd4TWpBd01EQmFNRTB4Q3pBSkJnTlZCQVlUQWxWVA0KTVJVd0V3WURWUVFLRXd4RWFXZHBRMlZ5ZENCSmJtTXhKekFsQmdOVkJBTVRIa1JwWjJsRFpYSjBJRk5JUVRJZw0KVTJWamRYSmxJRk5sY25abGNpQkRRVENDQVNJd0RRWUpLb1pJaHZjTkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQg0KQU55dVdKQk53Y1F3RlpBMVcyNDhnaFgxTEZ5OTQ5di9jVVA2WkNXQTFPNFlvazN3WnRBS2MyNFJtRFlYWks4Mw0KbmYzNlFZU3Z4NitNL2hwelRjOHpsNUNpbG9kVGd5dTVwblZJTFIxV04zdmFNVElhMTZ5ckJ2U3FYVXUzUjBiZA0KS3BQRGtDNTVnSUR2RXdScUZEdTFtNUsrd2dkbFR2emEvUDk2cnR4Y2ZsVXhET2c1QjZUWHZpL1RDMnJTc2Q5Zg0KL2xkMFV6czFnTjJ1amtTWXM1OE8wOXJnMS9SckthdEVwMHRZaEcyU1M0SEQybk9MRXBkSWtBUkZkUnJkTnpHWA0Ka3VqTlZBMDc1TUUvT1Y0dXVQTmNmaENPaGtFQWpVVm1SN0NoWmM2Z3Fpa0pUdk9YNitndXF3OXlwekFPK3NmMA0KL1JSM3c2UmJLRmZDcy9tQy9iZEZXSnNDQXdFQUFhT0NBVm93Z2dGV01CSUdBMVVkRXdFQi93UUlNQVlCQWY4Qw0KQVFBd0RnWURWUjBQQVFIL0JBUURBZ0dHTURRR0NDc0dBUVVGQndFQkJDZ3dKakFrQmdnckJnRUZCUWN3QVlZWQ0KYUhSMGNEb3ZMMjlqYzNBdVpHbG5hV05sY25RdVkyOXRNSHNHQTFVZEh3UjBNSEl3TjZBMW9ET0dNV2gwZEhBNg0KTHk5amNtd3pMbVJwWjJsalpYSjBMbU52YlM5RWFXZHBRMlZ5ZEVkc2IySmhiRkp2YjNSRFFTNWpjbXd3TjZBMQ0Kb0RPR01XaDBkSEE2THk5amNtdzBMbVJwWjJsalpYSjBMbU52YlM5RWFXZHBRMlZ5ZEVkc2IySmhiRkp2YjNSRA0KUVM1amNtd3dQUVlEVlIwZ0JEWXdOREF5QmdSVkhTQUFNQ293S0FZSUt3WUJCUVVIQWdFV0hHaDBkSEJ6T2k4dg0KZDNkM0xtUnBaMmxqWlhKMExtTnZiUzlEVUZNd0hRWURWUjBPQkJZRUZBK0FZUnlDTVdIVkx5am5qVVk0dEN6aA0KeHRuaU1COEdBMVVkSXdRWU1CYUFGQVBlVURWVzBVeTdadkNqNGhzYnc1ZXlQZEZWTUEwR0NTcUdTSWIzRFFFQg0KQ3dVQUE0SUJBUUFqUHQ5TDBqRkNwYlorUWx3YVJNeHAwV2kwWFV2Z0JDRnNTK0p0ekxIZ2w0K21Vd25OcWlwbA0KNVRsUEhvT2xibHlZb2lRbTV2dWg3WlBITGdMR1RVcS9zRUxmZU5xenFQbHQveUdGVXpaZ1RIYk83RGpjMWxHQQ0KOE1YVzVkUk5KMlNybThjK2NmdElsN2d6YmNrVEIrNldvaHNZRmZaY1RFRHRzOExzLzNIQjQwZi8xTGtBdERkQw0KMmlESjZtNks3aFFHcm4yaVdaaUlxQnR2TGZUeXlSUmZKczhzalg3dE44Q3AxVG01Z3I4WkRPbzByd0FoYVBpdA0KYytMSk10bzRKUXRWMDVvZDhHaUc3UzVCTk85OHBWQWR2enI1MDhFSURPYnRIb3BZSmVTNGQ2MHRidlZTM2JSMA0KajZ0SkxwMDdrelFvSDNqT2xPckh2ZFBKYlJ6ZVhETHoNCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0NCg=='
key='ASK RYAN FOR THIS'
conf='dXNlciB3d3ctZGF0YTsKd29ya2VyX3Byb2Nlc3NlcyBhdXRvOwpwaWQgL3J1bi9uZ2lueC5waWQ7CgpldmVudHMgewoJd29ya2VyX2Nvbm5lY3Rpb25zIDc2ODsKCW11bHRpX2FjY2VwdCBvZmY7Cn0KCmh0dHAgewoKCSMjCgkjIEJhc2ljIFNldHRpbmdzCgkjIwoKCXNlbmRmaWxlIG9uOwoJdGNwX25vcHVzaCBvbjsKCXRjcF9ub2RlbGF5IG9uOwoJa2VlcGFsaXZlX3RpbWVvdXQgNjU7Cgl0eXBlc19oYXNoX21heF9zaXplIDIwNDg7CglzZXJ2ZXJfdG9rZW5zIG9mZjsKCXNlcnZlcl9uYW1lc19oYXNoX2J1Y2tldF9zaXplIDY0OwoJaW5jbHVkZSAvZXRjL25naW54L21pbWUudHlwZXM7CglkZWZhdWx0X3R5cGUgYXBwbGljYXRpb24vb2N0ZXQtc3RyZWFtOwoKCSMjCgkjIExvZ2dpbmcgU2V0dGluZ3MKCSMjCgoJYWNjZXNzX2xvZyBvZmY7CgllcnJvcl9sb2cgL2Rldi9udWxsIGNyaXQ7CgoJIyMKCSMgR3ppcCBTZXR0aW5ncwoJIyMKCglnemlwIG9uOwoJZ3ppcF9odHRwX3ZlcnNpb24gMS4wOwoJZ3ppcF9zdGF0aWMgYWx3YXlzOwoKCSMjCgkjIFNlcnZlciBTZXR0aW5ncwoJIyMKCglzZXJ2ZXIgewoJCWxpc3RlbiAxMjcuMC4wLjE6ODA4MDsKCQlyZXR1cm4gMzAxIGh0dHBzOi8vY3lwaGRieWhpZGRlbmJocy5vbmlvbiRyZXF1ZXN0X3VyaTsKCX0KCglzZXJ2ZXIgewoJCWxpc3RlbiAxMjcuMC4wLjE6ODA4MSBzc2w7CgoJCXNzbF9jZXJ0aWZpY2F0ZSBzc2wvY2VydC5wZW07CgkJc3NsX2NlcnRpZmljYXRlX2tleSBzc2wva2V5LnBlbTsKCgkJc3NsX3ByZWZlcl9zZXJ2ZXJfY2lwaGVycyBvbjsKCQlhZGRfaGVhZGVyIFN0cmljdC1UcmFuc3BvcnQtU2VjdXJpdHkgJ21heC1hZ2U9MzE1MzYwMDA7IGluY2x1ZGVTdWJkb21haW5zJzsKCQlzc2xfcHJvdG9jb2xzIFRMU3YxIFRMU3YxLjEgVExTdjEuMjsKCQlzc2xfY2lwaGVycyAnRUNESEUtUlNBLUFFUzEyOC1HQ00tU0hBMjU2OkVDREhFLUVDRFNBLUFFUzEyOC1HQ00tU0hBMjU2OkVDREhFLVJTQS1BRVMyNTYtR0NNLVNIQTM4NDpFQ0RIRS1FQ0RTQS1BRVMyNTYtR0NNLVNIQTM4NDpESEUtUlNBLUFFUzEyOC1HQ00tU0hBMjU2OkRIRS1EU1MtQUVTMTI4LUdDTS1TSEEyNTY6a0VESCtBRVNHQ006RUNESEUtUlNBLUFFUzEyOC1TSEEyNTY6RUNESEUtRUNEU0EtQUVTMTI4LVNIQTI1NjpFQ0RIRS1SU0EtQUVTMTI4LVNIQTpFQ0RIRS1FQ0RTQS1BRVMxMjgtU0hBOkVDREhFLVJTQS1BRVMyNTYtU0hBMzg0OkVDREhFLUVDRFNBLUFFUzI1Ni1TSEEzODQ6RUNESEUtUlNBLUFFUzI1Ni1TSEE6RUNESEUtRUNEU0EtQUVTMjU2LVNIQTpESEUtUlNBLUFFUzEyOC1TSEEyNTY6REhFLVJTQS1BRVMxMjgtU0hBOkRIRS1EU1MtQUVTMTI4LVNIQTI1NjpESEUtUlNBLUFFUzI1Ni1TSEEyNTY6REhFLURTUy1BRVMyNTYtU0hBOkRIRS1SU0EtQUVTMjU2LVNIQTpBRVMxMjgtR0NNLVNIQTI1NjpBRVMyNTYtR0NNLVNIQTM4NDpBRVMxMjgtU0hBMjU2OkFFUzI1Ni1TSEEyNTY6QUVTMTI4LVNIQTpBRVMyNTYtU0hBOkFFUzpDQU1FTExJQTpERVMtQ0JDMy1TSEE6IWFOVUxMOiFlTlVMTDohRVhQT1JUOiFERVM6IVJDNDohTUQ1OiFQU0s6IWFFQ0RIOiFFREgtRFNTLURFUy1DQkMzLVNIQTohRURILVJTQS1ERVMtQ0JDMy1TSEE6IUtSQjUtREVTLUNCQzMtU0hBJzsKCgkJcm9vdCAvd3d3OwoKCQlsb2NhdGlvbiAvIHsKCQkJcHJveHlfcGFzcyBodHRwczovL3Byb2QtZG90LWN5cGgtY29tLWRvdC1jeXBobWUuYXBwc3BvdC5jb20vOwoJCX0KCgkJbG9jYXRpb24gL2ltLyB7CgkJCXByb3h5X3Bhc3MgaHR0cHM6Ly9wcm9kLWRvdC1jeXBoLWltLWRvdC1jeXBobWUuYXBwc3BvdC5jb20vOwoJCX0KCgkJbG9jYXRpb24gL21lLyB7CgkJCXByb3h5X3Bhc3MgaHR0cHM6Ly9wcm9kLWRvdC1jeXBoLW1lLWRvdC1jeXBobWUuYXBwc3BvdC5jb20vOwoJCX0KCgkJbG9jYXRpb24gL2FwaS8gewoJCQlwcm94eV9wYXNzIGh0dHBzOi8vcHJvZC1kb3QtZGVmYXVsdC1kb3QtY3lwaG1lLmFwcHNwb3QuY29tLzsKCQl9CgoJCWxvY2F0aW9uIC9nb29nbGUvdGFsa2dhZGdldC8gewoJCQlwcm94eV9wYXNzIGh0dHBzOi8vdGFsa2dhZGdldC5nb29nbGUuY29tL3RhbGtnYWRnZXQvOwoJCX0KCgkJbG9jYXRpb24gL2dvb2dsZS9hbmFseXRpY3MvIHsKCQkJcHJveHlfcGFzcyBodHRwczovL3d3dy5nb29nbGUtYW5hbHl0aWNzLmNvbS87CgkJfQoKCQlsb2NhdGlvbiAvY2RuLyB7CgkJCWFkZF9oZWFkZXIgQ2FjaGUtQ29udHJvbCAncHVibGljLCBtYXgtYWdlPTMxNTM2MDAwJzsKCQkJYWRkX2hlYWRlciBBY2Nlc3MtQ29udHJvbC1BbGxvdy1PcmlnaW4gJyonOwoJCQlhZGRfaGVhZGVyIEFjY2Vzcy1Db250cm9sLUFsbG93LU1ldGhvZHMgJ0dFVCc7CgkJfQoKCQlsb2NhdGlvbiA9IC9waW5nIHsKCQkJYWRkX2hlYWRlciBDb250ZW50LVR5cGUgJ3RleHQvcGxhaW4nOwoJCQlhZGRfaGVhZGVyIEFjY2Vzcy1Db250cm9sLUFsbG93LU9yaWdpbiAnKic7CgkJCWFkZF9oZWFkZXIgQWNjZXNzLUNvbnRyb2wtQWxsb3ctTWV0aG9kcyAnR0VUJzsKCQkJcmV0dXJuIDIwMCBwb25nOwoJCX0KCX0KfQo='
script='IyEvYmluL2Jhc2gKCm1rZGlyIC1wIC93d3cubmV3L2NkbgpjZCAvd3d3Lm5ldy9jZG4KCndnZXQgaHR0cHM6Ly9naXRodWIuY29tL2N5cGgvY3lwaC5naXRodWIuaW8vYXJjaGl2ZS9tYXN0ZXIuemlwIC1PIGRvdGhlbW92ZS56aXAKdW56aXAgZG90aGVtb3ZlLnppcApyZXBvPSIkKGxzIHwgZ3JlcCAtdiBkb3RoZW1vdmUuemlwKSIKbXYgJHJlcG8vKiAuLwpybSAtcmYgZG90aGVtb3ZlLnppcCAkcmVwbwpnemlwIC05ciAuCmNobW9kIDc3NyAtUiAuCgpjZCAvCgppZiBbIC1kIC93d3cubmV3L2Nkbi93ZWJzaWduIF0gOyB0aGVuCglybSAtcmYgL3d3dy5vbGQKCW12IC93d3cgL3d3dy5vbGQKCW12IC93d3cubmV3IC93d3cKZWxzZQoJcm0gLXJmIC93d3cubmV3CmZpCgoKaWYgWyAkKHBzIGF1eCB8IGdyZXAgbmdpbnggfCBncmVwIC12IGdyZXAgfCB3YyAtbCkgLWx0IDEgXSA7IHRoZW4KCXNlcnZpY2Ugbmdpbnggc3RvcAoJc2VydmljZSBuZ2lueCBzdGFydApmaQoKaWYgWyAkKHBzIGF1eCB8IGdyZXAgdG9yIHwgZ3JlcCAtdiBncmVwIHwgd2MgLWwpIC1sdCAxIF0gOyB0aGVuCglzZXJ2aWNlIHRvciBzdG9wCglzZXJ2aWNlIHRvciBzdGFydApmaQo='
update='IyEvYmluL2Jhc2gKCmV4cG9ydCBERUJJQU5fRlJPTlRFTkQ9bm9uaW50ZXJhY3RpdmUKYXB0LWdldCAteSAtLWZvcmNlLXllcyB1cGRhdGUKYXB0LWdldCAteSAtLWZvcmNlLXllcyBkaXN0LXVwZ3JhZGUKcmVib290Cg=='


dir="$(pwd)"
cd $(cd "$(dirname "$0")"; pwd) # $(dirname `readlink -f "${0}" || realpath "${0}"`)

sed -i 's/# deb /deb /g' /etc/apt/sources.list
sed -i 's/\/\/.*archive.ubuntu.com/\/\/archive.ubuntu.com/g' /etc/apt/sources.list

export DEBIAN_FRONTEND=noninteractive
apt-add-repository -y ppa:nginx/development
echo "deb http://deb.torproject.org/torproject.org $(lsb_release -c | awk '{print $2}') main" >> /etc/apt/sources.list
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | apt-key add -
apt-get -y --force-yes update
apt-get -y --force-yes dist-upgrade
apt-get -y --force-yes install nginx openssl unzip deb.torproject.org-keyring tor

mkdir /etc/nginx/ssl
chmod 600 /etc/nginx/ssl
echo "${cert}" | base64 --decode > /etc/nginx/ssl/cert.pem
echo "${key}" | base64 --decode > /etc/nginx/ssl/key.pem

echo "${conf}" | base64 --decode | sed "s/worker_connections 768;/worker_connections $(ulimit -n);/g" > /etc/nginx/nginx.conf

echo '
	HiddenServiceDir /var/lib/tor/hidden_service/
	HiddenServicePort 80 127.0.0.1:8080
	HiddenServicePort 443 127.0.0.1:8081
' >> /etc/tor/torrc

mkdir /var/lib/tor/hidden_service/
echo "${onionaddress}" > /var/lib/tor/hidden_service/hostname
echo "${onionkey}" | base64 --decode > /var/lib/tor/hidden_service/private_key
chown -R debian-tor:debian-tor /var/lib/tor/hidden_service/
chmod -R 0700 /var/lib/tor/hidden_service/

rm -rf /www
echo "${script}" | base64 --decode > /codesync.sh
echo "${update}" | base64 --decode > /update.sh
chmod 700 /codesync.sh
chmod 700 /update.sh
/codesync.sh

updatehour=$RANDOM
let 'updatehour %= 24'
updateday=$RANDOM
let 'updateday %= 7'

crontab -l > /cyphcdn.cron
echo '0,30 * * * * /codesync.sh' >> /cyphcdn.cron
echo "0 ${updatehour} * * ${updateday} /update.sh" >> /cyphcdn.cron
crontab /cyphcdn.cron
rm /cyphcdn.cron

rm cyphonionsetup.sh
reboot