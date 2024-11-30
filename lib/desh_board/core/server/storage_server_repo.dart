import 'dart:io';
import 'dart:typed_data';

abstract class StorageServerRepo {
  /// Uploads a file to the storage server and returns its download URL.
  Future<String?> uploadFile(
    File file,
    String path,
  );

  /// Deletes a file from the storage server using its download URL.
  Future<bool> deleteFile(
    String fileUrl,
  );

  /// Updates an existing file on the storage server and returns the new URL.
  Future<String?> updateFile(
    File file,
    String fileUrl,
  );

  /// Downloads a file from the storage server and returns its data as Uint8List.
  Future<Uint8List?> downloadFile(
    String fileUrl,
  );

  /// Retrieves the download URL of a file from the storage server.
  Future<String?> getFileUrl(
    String path,
  );
}
