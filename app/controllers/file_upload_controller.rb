class FileUploadController < ApplicationController
    def post
        if params[:file]
            blob = ActiveStorage::Blob.create_after_upload!(
                io: StringIO.new((Base64.decode64(params[:file]))),
                filename: "image.png",
                content_type: "image/png",
            )
            photo = url_for(blob)

            if
                render json: photo, status: :ok
            end
        end
    end
end
