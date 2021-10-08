module Api
  module V1
    class ChannelsController < ApplicationController
      def index
        channels = Channel.order('created_ts DESC');
        render json: {status: 'SUCCESS', data:channels},status: :ok
      end

      def show
        channel = Channel.find_by_channel_name(params[:id])
        render json: {status: 'SUCCESS', data:channel},status: :ok
      end

      def create
        channel = Channel.new(channel_params)

        if channel.save
          render json: {status: 'SUCCESS', data:channel},status: :ok
        else
          render json: {status: 'ERROR', data:channel.errors},status: :unprocessable_entity
        end
      end

      def destroy
      end

      def update
      end

      private

      def channel_params
        params.permit(:channelName)
      end
    end
  end
end
