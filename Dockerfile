FROM amazon/aws-lambda-ruby:2.5

COPY app.rb /var/task/

COPY honeycomb-lambda-extension /opt/extensions/honeycomb-lambda-extension
RUN chmod +x /opt/extensions/honeycomb-lambda-extension

ENV LIBHONEY_DATASET ruby-user-service
ENV LIBHONEY_API_KEY f84c1c641c2cd0292ed5391d1f8310d7

CMD [ "app.handler" ]
