FROM centos:latest

RUN yum install -y epel-release && \
	yum install -y openvpn unzip && \
	curl -sS "https://www.privateinternetaccess.com/openvpn/openvpn-strong.zip" -o /temp.zip && \
	unzip -q /temp.zip -d /pia && \
	rm -f /temp.zip && \
	yum remove -y epel-release unzip && \
	yum clean all

COPY openvpn.sh /bin/openvpn.sh
WORKDIR /pia

ENV REGION="US East"
ENV USERNAME=""
ENV PASSWORD=""
ENTRYPOINT ["openvpn.sh"]