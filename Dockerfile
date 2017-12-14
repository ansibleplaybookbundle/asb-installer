FROM ansibleplaybookbundle/apb-base

LABEL "com.redhat.apb.spec"=\
"dmVyc2lvbjogMS4wCm5hbWU6IGFzYi1pbnN0YWxsZXIKZGVzY3JpcHRpb246IFRoaXMgaXMgYSBz\
YW1wbGUgYXBwbGljYXRpb24gZ2VuZXJhdGVkIGJ5IGFwYiBpbml0CmJpbmRhYmxlOiBGYWxzZQph\
c3luYzogb3B0aW9uYWwKbWV0YWRhdGE6CiAgZGlzcGxheU5hbWU6IGFzYi1pbnN0YWxsZXIKcGxh\
bnM6CiAgLSBuYW1lOiBkZWZhdWx0CiAgICBkZXNjcmlwdGlvbjogVGhpcyBkZWZhdWx0IHBsYW4g\
ZGVwbG95cyBhc2ItaW5zdGFsbGVyCiAgICBmcmVlOiBUcnVlCiAgICBtZXRhZGF0YToge30KICAg\
IHBhcmFtZXRlcnM6IFtd"

COPY playbooks /opt/apb/actions
COPY roles /opt/ansible/roles
RUN chmod -R g=u /opt/{ansible,apb}

RUN yum -y install openssl && yum clean all

USER apb
