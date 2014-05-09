require "log4r"

module VagrantPlugins
  module Openstack
    module Action
      class StopServer
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant_openstack::action::stop_server")
        end

        def call(env)
          if env[:machine].id
            env[:ui].info(I18n.t("vagrant_openstack.stopping_server"))
            client = env[:openstack_client]
            client.stop_server(env, env[:machine].id)
            env[:machine].id = nil
          end
          @app.call(env)
        end
      end
    end
  end
end
